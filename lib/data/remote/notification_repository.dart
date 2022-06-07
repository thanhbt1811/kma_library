import 'package:getx_base_code/common/common_export.dart';
import 'package:getx_base_code/data/api_constans.dart';
import 'package:getx_base_code/domain/models/base_response.dart';

class NotificationRepository {
  final ApiClient _apiClient;

  NotificationRepository(this._apiClient);

  Future<BaseResponse> getNotification(
      String author, int page, int size) async {
    return _apiClient.request(
        path: ApiConstants.notification,
        method: NetworkMethod.get,
        basicAuthen: author,
        queryParameters: {
          ArgumentConstants.pageSize: size,
          ArgumentConstants.pageNumber: page
        });
  }

  Future<BaseResponse> deleteNotification(String author, String id) async {
    return _apiClient.request(
        path: ApiConstants.notification + '/' + id,
        method: NetworkMethod.delete,
        basicAuthen: author);
  }

  Future<BaseResponse> getNew(int page, int size) async {
    return _apiClient.request(
        path: ApiConstants.newNoti,
        method: NetworkMethod.get,
        queryParameters: {
          ArgumentConstants.pageSize: size,
          ArgumentConstants.pageNumber: page
        });
  }
}
