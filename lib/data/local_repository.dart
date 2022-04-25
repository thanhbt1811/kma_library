import 'package:getx_base_code/common/common_export.dart';

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
}
