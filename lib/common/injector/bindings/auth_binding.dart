import 'package:get/get.dart';
import 'package:getx_base_code/common/common_export.dart';
import 'package:getx_base_code/presentation/journey/auth/forgot_password/forgot_password_controller.dart';
import 'package:getx_base_code/presentation/journey/auth/login/login_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      getIt<LoginController>(),
    );
    Get.put(
      getIt<ForgotPasswordController>(),
    );
  }
}
