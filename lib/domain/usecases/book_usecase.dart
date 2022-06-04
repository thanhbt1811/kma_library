import 'package:flutter/cupertino.dart';
import 'package:getx_base_code/common/common_export.dart';
import 'package:getx_base_code/common/config/network/session_data.dart';
import 'package:getx_base_code/data/remote/book_repository.dart';
import 'package:getx_base_code/domain/models/book_model.dart';
import 'package:getx_base_code/domain/models/hire_model.dart';

class BookUsecase {
  final BookRepository _bookRepository;

  BookUsecase(this._bookRepository);

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

  Future<bool> hiringBook(BuildContext context, DateTime estaimationHiredDate,
      List<String> hireId) async {
    final res = await requestApi(
        () => _bookRepository.hiringBook(SessionData.authToken,
            estaimationHiredDate.toIso8601String(), hireId),
        context);
    return res.result ?? false;
  }

  Future<bool> hireBook(BuildContext context, String bookId) async {
    final res = await requestApi(
        () => _bookRepository.hireBook(SessionData.authToken, bookId), context);
    if (res.result ?? false) {
      return true;
    } else {
      return false;
    }
  }

  Future<List<HireModel>> getEstimatingBook(
      BuildContext context, int page, int size) async {
    final hireList = <HireModel>[];
    final res = await requestApi(
        () =>
            _bookRepository.estimatingBooks(SessionData.authToken, page, size),
        context);
    if (res.result ?? false) {
      for (final data in res.data['data']) {
        hireList.add(
          HireModel.fromJson(data),
        );
      }
    }
    return hireList;
  }
}
