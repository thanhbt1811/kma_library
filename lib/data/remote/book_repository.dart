import 'dart:convert';

import 'package:getx_base_code/common/common_export.dart';
import 'package:getx_base_code/data/api_constans.dart';
import 'package:getx_base_code/domain/models/base_response.dart';

class BookRepository {
  final ApiClient _apiClient;

  BookRepository(this._apiClient);

  Future<BaseResponse> getBooks(
      String author, int pageNumber, int pageSize, String search) async {
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

  Future<BaseResponse> getBookWithCategory(String author, String categoryId,
      int pageSize, int pageNumber, String? searchKey) async {
    final response = await _apiClient.request(
      path: ApiConstants.books,
      basicAuthen: author,
      method: NetworkMethod.get,
      queryParameters: {
        ArgumentConstants.searchKey: searchKey,
        ArgumentConstants.categoryId: categoryId,
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

  Future<BaseResponse> getHiringBook(String author, int page, int size) async {
    return _apiClient.request(
        path: ApiConstants.hiringBooks,
        method: NetworkMethod.get,
        basicAuthen: author,
        queryParameters: {
          ArgumentConstants.pageSize: size,
          ArgumentConstants.pageNumber: page
        });
  }

  Future<BaseResponse> getReturnedBook(
      String author, int page, int size) async {
    return _apiClient.request(
        path: ApiConstants.returnedBook,
        method: NetworkMethod.get,
        basicAuthen: author,
        queryParameters: {
          ArgumentConstants.pageSize: size,
          ArgumentConstants.pageNumber: page
        });
  }

  Future<BaseResponse> getBookInTerm(
      String author, int term, int page, int size) async {
    return _apiClient.request(
        path: ApiConstants.bookInTerm,
        method: NetworkMethod.get,
        basicAuthen: author,
        queryParameters: {
          ArgumentConstants.term: term,
          ArgumentConstants.pageSize: size,
          ArgumentConstants.pageNumber: page
        });
  }

  Future<BaseResponse> hiringBook(
      String author, String estaimationHiredDate, List<String> books) async {
    final res = await _apiClient.request(
        path: ApiConstants.estimatingHireBook,
        queryParameters: {
          ArgumentConstants.estaimatedHiredDate: estaimationHiredDate
        },
        data: jsonEncode(books),
        method: NetworkMethod.put,
        basicAuthen: author);
    return res;
  }

  Future<BaseResponse> hireBook(String author, String bookId) async {
    final res = await _apiClient.request(
        path: ApiConstants.hireBook,
        queryParameters: {ArgumentConstants.bookId: bookId},
        method: NetworkMethod.get,
        basicAuthen: author);
    return res;
  }

  Future<BaseResponse> estimatingBooks(
      String author, int page, int size) async {
    final res = await _apiClient.request(
        path: ApiConstants.estimatingBook,
        queryParameters: {
          ArgumentConstants.pageSize: size,
          ArgumentConstants.pageNumber: page
        },
        method: NetworkMethod.get,
        basicAuthen: author);
    return res;
  }

  Future<BaseResponse> returnedBook(String author, String estaimatedReturnDate,
      List<String> returnIds) async {
    final res = await _apiClient.request(
        path: ApiConstants.estimateReturnDate,
        queryParameters: {
          ArgumentConstants.estaimatedReturnDate: estaimatedReturnDate
        },
        data: jsonEncode(returnIds),
        method: NetworkMethod.post,
        basicAuthen: author);
    return res;
  }

  Future<BaseResponse> getEstimatedBook(
      String author, int page, int size) async {
    final res = await _apiClient.request(
        basicAuthen: author,
        queryParameters: {
          ArgumentConstants.pageSize: size,
          ArgumentConstants.pageNumber: page
        },
        path: ApiConstants.estimatedBook,
        method: NetworkMethod.get);
    return res;
  }

  Future<BaseResponse> getEstimateReturnBook(
      String author, int page, int size) async {
    final res = await _apiClient.request(
        basicAuthen: author,
        queryParameters: {
          ArgumentConstants.pageSize: size,
          ArgumentConstants.pageNumber: page
        },
        path: ApiConstants.estimateReturnedDate,
        method: NetworkMethod.get);
    return res;
  }
}
