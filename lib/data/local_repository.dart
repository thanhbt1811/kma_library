import 'package:getx_base_code/common/common_export.dart';
import 'package:getx_base_code/common/constants/secure_storage_constants.dart';

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
