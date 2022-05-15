import 'package:getx_base_code/common/common_export.dart';
import 'package:getx_base_code/data/api_constans.dart';
import 'package:getx_base_code/domain/models/base_response.dart';

class BookRepository {
  final ApiClient _apiClient;

  BookRepository(this._apiClient);

  Future<BaseResponse> getBooks(
      String author, int pageNumber, int pageSize) async {
    final response = await _apiClient.request(
      path: ApiConstants.books,
      basicAuthen: author,
      method: NetworkMethod.get,
      queryParameters: {
        ArgumentConstants.pageNumber: pageNumber,
        ArgumentConstants.pageSize: pageSize
      },
    );
    return response;
  }

  Future<BaseResponse> getBookWithCategory(
      String author, String categoryId, int pageSize, int pageNumber) async {
    final response = await _apiClient.request(
      path: '${ApiConstants.categories}/{$categoryId}/books',
      basicAuthen: author,
      method: NetworkMethod.get,
      queryParameters: {
        ArgumentConstants.pageNumber: pageNumber,
        ArgumentConstants.pageSize: pageSize
      },
    );
    return response;
  }

  Future<BaseResponse> getBookWithId(String author, String id) async {
    final response = await _apiClient.request(
      path: '${ApiConstants.books}/{$id}',
      method: NetworkMethod.get,
      basicAuthen: author,
    );
    return response;
  }
}
