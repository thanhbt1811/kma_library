import 'dart:convert';

import 'package:getx_base_code/common/common_export.dart';
import 'package:getx_base_code/common/constants/secure_storage_constants.dart';
import 'package:getx_base_code/domain/models/book_model.dart';

class LocalRepository {
  Future<void> setToken(String token) async {
    await SharePreferencesConstants.prefs
        .setString(SharePreferencesConstants.token, token);
  }

  String getToken() {
    return SharePreferencesConstants.prefs
            .getString(SharePreferencesConstants.token) ??
        '';
  }

  Future<void> setBookToCart(BookModel book) async {
    final stringBooks =
        SharePreferencesConstants.prefs.getStringList("book_list");
    stringBooks?.add(json.encode(book.toJson()));
    await SharePreferencesConstants.prefs
        .setStringList("book_list", stringBooks ?? []);
  }

  List<BookModel> getBook() {
    final res = SharePreferencesConstants.prefs.getStringList("book_list");
    final books = <BookModel>[];
    for (final data in res ?? []) {
      books.add(
        BookModel.fromJson(json.decode(data)),
      );
    }
    return books;
  }

  Future setUsername(String username) async {
    return await SecureStorageConstants.setString(
        SecureStorageConstants.username, username);
  }

  Future setPassword(String password) async {
    return await SecureStorageConstants.setString(
        SecureStorageConstants.password, password);
  }

  Future<String> getUsername() async {
    return await SecureStorageConstants.getString(
        SecureStorageConstants.username);
  }

  Future<String> getPassword() async {
    return await SecureStorageConstants.getString(
        SecureStorageConstants.password);
  }
}
