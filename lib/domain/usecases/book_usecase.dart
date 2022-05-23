import 'package:flutter/cupertino.dart';
import 'package:getx_base_code/common/common_export.dart';
import 'package:getx_base_code/common/config/network/session_data.dart';
import 'package:getx_base_code/data/local_repository.dart';
import 'package:getx_base_code/data/remote/book_repository.dart';
import 'package:getx_base_code/domain/models/book_model.dart';
import 'package:getx_base_code/domain/models/hire_model.dart';

class BookUsecase {
  final BookRepository _bookRepository;
  final LocalRepository _localRepository;

  BookUsecase(this._bookRepository, this._localRepository);

  Future<List<BookModel>> getBooks(BuildContext context, int pageNumber,
      int pageSize, String searchKey) async {
    final response = await requestApi(
        () => _bookRepository.getBooks(
            SessionData.authToken, pageNumber, pageSize, searchKey),
        context);
    var books = <BookModel>[];
    if (response.result ?? false) {
      books = _convertJsonToBookList(response.data['data']);
    }
    return books;
  }

  Future<List<BookModel>> getBooksWithCategory(
      BuildContext context,
      String categoryId,
      int pageNumber,
      int pageSize,
      String? searchKey) async {
    final response = await requestApi(
        () => _bookRepository.getBookWithCategory(
            SessionData.authToken, categoryId, pageSize, pageNumber, searchKey),
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

  Future<void> addToCart(BookModel book) async {
    await _localRepository.setBookToCart(book);
  }

  List<BookModel> getCartList() {
    return _localRepository.getBook();
  }

  Future<List<HireModel>> getHiringBook(
      BuildContext context, int page, int size) async {
    final hires = <HireModel>[];
    final res = await requestApi(
        () => _bookRepository.getHiringBook(SessionData.authToken, page, size),
        context);
    if (res.result ?? false) {
      final data = res.data['data'];
      for (final hire in data) {
        hires.add(
          HireModel.fromJson(hire),
        );
      }
    }
    return hires;
  }

  Future<List<HireModel>> getReturned(
      BuildContext context, int page, int size) async {
    final returns = <HireModel>[];
    final res = await requestApi(
        () =>
            _bookRepository.getReturnedBook(SessionData.authToken, page, size),
        context);
    if (res.result ?? false) {
      final data = res.data['data'];
      for (final returnBokk in data) {
        returns.add(
          HireModel.fromJson(returnBokk),
        );
      }
    }
    return returns;
  }

  Future<List<BookModel>> getBookInTerm(
      BuildContext context, int term, int page, int size) async {
    final books = <BookModel>[];
    final res = await requestApi(
        () => _bookRepository.getBookInTerm(
            SessionData.authToken, term, page, size),
        context);
    if (res.result ?? false) {
      for (final data in res.data['data']) {
        books.add(
          BookModel.fromJson(data),
        );
      }
    }
    return books;
  }
}
