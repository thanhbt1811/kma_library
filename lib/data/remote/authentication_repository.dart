import 'dart:convert';

import 'package:getx_base_code/common/common_export.dart';
import 'package:getx_base_code/data/api_constans.dart';
import 'package:getx_base_code/domain/models/base_response.dart';

class AuthenticationRepository {
  final ApiClient _apiClient;

  AuthenticationRepository(this._apiClient);

  Future<BaseResponse> login(Map<String, dynamic> data) async {
    final response = await _apiClient.request(
      method: NetworkMethod.post,
      path: ApiConstants.login,
      data: jsonEncode(data),
    );
    return response;
  }
}
