import 'package:get/get.dart';

import 'package:getx_base_code/common/common_export.dart';
import 'package:getx_base_code/presentation/controllers/mixin/export.dart';

class MainController extends GetxController with MixinController {
  RxInt rxCurrentNavIndex = 0.obs;

  void onChangedNav(int index) {
    rxCurrentNavIndex.value = index;
  }

  @override
  void onInit() {
    super.onInit();
    setStatusBarStyle(statusBarStyleType: StatusBarStyleType.dark);
  }
}