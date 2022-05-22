import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_base_code/common/constants/constants_export.dart';
import 'package:getx_base_code/domain/request/login_request.dart';
import 'package:getx_base_code/domain/usecases/authentication_usecase.dart';
import 'package:getx_base_code/presentation/controllers/app_controller.dart';
import 'package:getx_base_code/presentation/controllers/core_controller.dart';

class LoginController extends CoreController {
  final AuthenticationUsecase _authenticationUsecase;
  final TextEditingController studentId = TextEditingController();
  final TextEditingController passwordCtl = TextEditingController();

  RxBool rxActiveBtn = false.obs;

  LoginController(this._authenticationUsecase);

  void setRxActiveBtn() {
    rxActiveBtn.value =
        studentId.text.isNotEmpty && passwordCtl.text.isNotEmpty;
  }

  Future<void> login() async {
    rxLoadedType.value = LoadedType.start;
    final LoginRequest request = LoginRequest(
      studentId: studentId.text.trim(),
      password: passwordCtl.text.trim(),
    );
    final response = await _authenticationUsecase.login(context, request);
    if (response != null) {
      final appController = Get.find<AppController>();
      appController.user = response;
      Get.toNamed(AppRoutes.main);
    }
    rxLoadedType.value = LoadedType.finish;
  }
}
