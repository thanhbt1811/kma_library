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

  Future<Map<DateTime, List<HireModel>>> getHiringBook(
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
    final Map<DateTime, List<HireModel>> hireMap =
        <DateTime, List<HireModel>>{};
    final itemDate = hires[0].hiredFrom;
    var date = DateTime(itemDate!.year, itemDate.month, itemDate.day);
    hireMap.putIfAbsent(date, () => [hires[0]]);
    for (var index = 1; index < hires.length; index++) {
      final book = hires[index];
      final bookDate = DateTime(
          book.hiredFrom!.year, book.hiredFrom!.month, book.hiredFrom!.day);
      if (bookDate == date) {
        hireMap[bookDate]?.add(book);
      } else {
        date = bookDate;
        hireMap.putIfAbsent(date, () => [book]);
      }
    }
    return hireMap;
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

  Future<Map<DateTime, List<HireModel>>> getReturnedBook(
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
    final Map<DateTime, List<HireModel>> returnedMap =
        <DateTime, List<HireModel>>{};
    final itemDate = returns[0].returnedDate;
    var date = DateTime(itemDate!.year, itemDate.month, itemDate.day);
    returnedMap.putIfAbsent(date, () => [returns[0]]);
    for (var index = 1; index < returns.length; index++) {
      final book = returns[index];
      final bookDate = DateTime(book.returnedDate!.year,
          book.returnedDate!.month, book.returnedDate!.day);
      if (bookDate == date) {
        returnedMap[bookDate]?.add(book);
      } else {
        date = bookDate;
        returnedMap.putIfAbsent(date, () => [book]);
      }
    }
    return returnedMap;
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

  Future<bool> estaimateReturnDate(BuildContext context,
      DateTime estaimateReturnDate, List<String> returnedId) async {
    final res = await requestApi(
        () => _bookRepository.returnedBook(SessionData.authToken,
            estaimateReturnDate.toIso8601String(), returnedId),
        context);
    return res.result ?? false;
  }

  Future<List<HireModel>> getEstimatedBook(
      BuildContext context, int page, int size) async {
    final hireList = <HireModel>[];
    final res = await requestApi(
        () =>
            _bookRepository.getEstimatedBook(SessionData.authToken, page, size),
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

  Future<List<HireModel>> getEstimateReturnBook(
      BuildContext context, int page, int size) async {
    final hireList = <HireModel>[];
    final res = await requestApi(
        () => _bookRepository.getEstimateReturnBook(
            SessionData.authToken, page, size),
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

  Future<bool> deleteBookFromCart(
      BuildContext context, List<String> idList) async {
    final res = await requestApi(
        () => _bookRepository.deleteBookFromCart(SessionData.authToken, idList),
        context);
    return res.result ?? false;
  }
}
