import 'package:get/get.dart';
import 'package:getx_base_code/common/common_export.dart';
import 'package:getx_base_code/domain/usecases/authentication_usecase.dart';
import 'package:getx_base_code/presentation/controllers/core_controller.dart';
import 'package:getx_base_code/presentation/widgets/export.dart';

class SplashController extends CoreController {
  final AuthenticationUsecase _authenticationUsecase;
  SplashController(this._authenticationUsecase);

  @override
  void onInit() {
    super.onInit();
    setStatusBarStyle(statusBarStyleType: StatusBarStyleType.light);
  }

  Future<void> initLogin() async {
    rxLoadedType.value = LoadedType.start;
    final loggedIn = await _authenticationUsecase.checkAutoLogin(context);
    if (loggedIn) {
      Get.offAndToNamed(AppRoutes.main);
    } else {
      showTopSnackBar(context, message: 'Đăng nhập không thành công');
      Get.offAndToNamed(AppRoutes.login);
    }
  }
}
