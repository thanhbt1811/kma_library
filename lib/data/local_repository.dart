import 'package:getx_base_code/common/common_export.dart';

class LocalRepository {
  Future<void> setPhone(String phone) async {
    await SharePreferencesConstants.prefs
        .setString(SharePreferencesConstants.phone, phone);
  }

  String getPhone() {
    return SharePreferencesConstants.prefs
        .getString(SharePreferencesConstants.phone) ??
        '';
  }
}