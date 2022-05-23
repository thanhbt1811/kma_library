import 'package:getx_base_code/common/common_export.dart';
import 'package:getx_base_code/data/api_constans.dart';
import 'package:getx_base_code/domain/models/base_response.dart';

class UserRepository {
  final ApiClient _apiClient;

  UserRepository(this._apiClient);

  Future<BaseResponse> getUser(String author) async {
    return _apiClient.request(
      path: ApiConstants.getMe,
      method: NetworkMethod.post,
      basicAuthen: author,
    );
  }

  Future<BaseResponse> updateAvatar(
      String auhtor, Map<String, dynamic> avatar) async {
    return _apiClient.request(
        method: NetworkMethod.put,
        path: ApiConstants.avatar,
        basicAuthen: auhtor,
        formData: avatar);
  }
}
