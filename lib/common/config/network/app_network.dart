import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:getx_base_code/common/common_export.dart';
import 'package:getx_base_code/domain/models/base_response.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class ApiClient {
  static const contentType = 'Content-Type';
  static const contentTypeJson = 'application/json; charset=utf-8';

  static final BaseOptions defaultOptions = BaseOptions(
    connectTimeout: 90000,
    sendTimeout: 90000,
    receiveTimeout: 90000,
    responseType: ResponseType.json,
    baseUrl: NetworkConfig.baseUrl,
  );

  Dio _dio = Dio();

  static final Map<BaseOptions, ApiClient> _instanceMap = {};

  factory ApiClient({BaseOptions? options}) {
    options ??= defaultOptions;
    if (_instanceMap.containsKey(options)) {
      return _instanceMap[options] ?? ApiClient();
    }
    final ApiClient apiClient = ApiClient._create(options: options);
    _instanceMap[options] = apiClient;
    return apiClient;
  }

  ApiClient._create({BaseOptions? options}) {
    options ??= defaultOptions;
    _dio = Dio(options);
    _dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        error: true,
        compact: true,
        maxWidth: 90));
  }

  static ApiClient get instance => ApiClient();

  String _getMethod(NetworkMethod method) {
    switch (method) {
      case NetworkMethod.get:
        return 'GET';
      case NetworkMethod.post:
        return 'POST';
      case NetworkMethod.delete:
        return 'DELETE';
      case NetworkMethod.path:
        return 'PATH';
      case NetworkMethod.put:
        return 'PUT';
      default:
        return 'GET';
    }
  }

  Future<BaseResponse> request(
      {String? path,
      NetworkMethod method = NetworkMethod.get,
      String? data,
      Function? fromJsonModel,
      Map<String, dynamic>? formData,
      Map<String, dynamic>? queryParameters,
      String? basicAuthen,
      bool getFullResponse = false}) async {
    // Ki???m tra c?? k???t n???i internet hay kh??ng
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      return BaseResponse(
        result: false,
        data: null,
        message: TransactionConstants.noConnectionError,
        code: 2106,
      );
    }
    // Ki???m tra c?? link API hay kh??ng
    if (isNullEmpty(path)) {
      logger('!!!!!!EMPTY URL!!!!!! - data: $data');
    }

    /// Config header truy???n v??o
    /// T??y v??o header c???a API ????? truy???n v??o
    Map<String, dynamic> headerMap = {};
    //   "From": deviceId,
    //   if (basicAuthen != null) "Authorization": 'Basic $basicAuthen',
    //   "Accept-Language": getX.Get.locale.toString() == 'en_US' ? 'en' : 'vi',
    //   "user-agent": 'vimo-work-app/1.0.0 $deviceType/${SessionData.appVersion}',
    //   "auth-token": SessionData.authToken ?? '',
    // };
    headerMap.putIfAbsent("accept", () => "*/*");
    if (basicAuthen != null) {
      headerMap.putIfAbsent('Authorization', () => basicAuthen);
    }
    Response response;
    try {
      var strMethod = _getMethod(method);
      response = await _dio.request(path ?? '',
          data: formData != null
              ? FormData.fromMap(formData)
              : data ?? jsonEncode({}),
          options: Options(
              method: strMethod,
              sendTimeout: 10000,
              receiveTimeout: 10000,
              headers: headerMap,
              contentType: formData != null ? 'multipart/form-data' : null),
          queryParameters: queryParameters);
      if (_isSuccessful(response.statusCode ?? -1)) {
        dynamic dataResult = response.data;
        logger('---Data Encoder For Parser---: ${json.encode(dataResult)}');
        return BaseResponse(
          result: true,
          data: dataResult,
          message: '',
          code: 1000,
        );
      }
    } on DioError catch (e) {
      log('DIO-Error message: ${e.message}');
      if (e.response != null) {
        dynamic dataResultError = e.response!.data;
        String errorMessage = dataResultError != null &&
                dataResultError.runtimeType.toString().contains('Map') &&
                !isNullEmpty(dataResultError['message'])
            ? dataResultError['message']
            : !isNullEmpty(e.response?.statusMessage)
                ? e.response?.statusMessage
                : e.message;
        String errorCode = dataResultError != null &&
                dataResultError.runtimeType.toString().contains('Map') &&
                !isNullEmpty(dataResultError['error'])
            ? dataResultError['error']
            : !isNullEmpty(e.response?.statusMessage)
                ? e.response?.statusMessage
                : e.message;
        return BaseResponse(
          result: false,
          data: dataResultError,
          message: errorMessage,
          code: e.response?.statusCode,
          errorCode: errorCode,
        );
      }
      if (e.error is SocketException) {
        SocketException socketException = e.error as SocketException;
        return BaseResponse(
          result: false,
          data: null,
          message: socketException.osError?.message ?? "",
          code: socketException.osError?.errorCode ?? 0,
        );
      }
      return BaseResponse(
        result: false,
        data: null,
        message: e.error != null ? e.error.toString() : "",
        code: -9999,
      );
    }
    throw ('Request NOT successful');
  }

  bool _isSuccessful(int i) {
    return i >= 200 && i <= 299;
  }
}
