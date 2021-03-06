import 'package:get/get.dart';
import 'package:getx_base_code/common/common_export.dart';
import 'package:getx_base_code/presentation/journey/auth/forgot_password/forgot_password_controller.dart';
import 'package:getx_base_code/presentation/journey/auth/login/login_controller.dart';
import 'package:getx_base_code/presentation/journey/auth/news/new_detail/new_detail_controller.dart';
import 'package:getx_base_code/presentation/journey/auth/news/news_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      getIt<LoginController>(),
    );
  }
}

class ForgotPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      getIt<ForgotPasswordController>(),
    );
  }
}

class NewsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyReplace(() => getIt<NewsController>());
  }
}

class NewsDetailBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyReplace(() => getIt<NewDetailController>());
  }
}
