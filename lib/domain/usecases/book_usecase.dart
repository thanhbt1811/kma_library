import 'package:flutter/cupertino.dart';
import 'package:getx_base_code/common/common_export.dart';
import 'package:getx_base_code/common/config/network/session_data.dart';
import 'package:getx_base_code/data/remote/book_repository.dart';
import 'package:getx_base_code/domain/models/book_model.dart';

class BookUsecase {
  final BookRepository _bookRepository;

  BookUsecase(this._bookRepository);

  Future<List<BookModel>> getBooks(
      BuildContext context, int pageNumber, int pageSize) async {
    final response = await requestApi(
        () => _bookRepository.getBooks(
            SessionData.authToken, pageNumber, pageSize),
        context);
    var books = <BookModel>[];
    if (response.result ?? false) {
      books = _convertJsonToBookList(response.data['data']);
    }
    return books;
  }

  Future<List<BookModel>> getBooksWithCategory(BuildContext context,
      String categoryId, int pageNumber, int pageSize) async {
    final response = await requestApi(
        () => _bookRepository.getBookWithCategory(
            SessionData.authToken, categoryId, pageSize, pageNumber),
        context);
    var books = _convertJsonToBookList(response.data['data']);
    return books;
  }

  Future<BookModel> getBook(BuildContext context, String id) async {
    final response = await requestApi(
        () => _bookRepository.getBookWithId(SessionData.authToken, id),
        context);
    return BookModel.fromJson(response.data);
  }

  List<BookModel> _convertJsonToBookList(dynamic datas) {
    final books = <BookModel>[];
    for (final data in datas ?? []) {
      books.add(
        BookModel.fromJson(data),
      );
    }
    return books;
  }
}
