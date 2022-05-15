import 'package:getx_base_code/common/common_export.dart';
import 'package:getx_base_code/data/api_constans.dart';
import 'package:getx_base_code/domain/models/base_response.dart';

class CategoryRepository {
  final ApiClient _apiClient;

  CategoryRepository(this._apiClient);

  Future<BaseResponse> getCategories(
      String author, int pageNumber, int pageSize) async {
    final response = await _apiClient.request(
        basicAuthen: author,
        // queryParameters: {
        //   ArgumentConstants.pageNumber: pageNumber,
        //   ArgumentConstants.pageSize: pageSize
        // },
        path: ApiConstants.categories);
    return response;
  }
}
