import 'package:get/get.dart';

import 'package:getx_base_code/common/common_export.dart';
import 'package:getx_base_code/presentation/controllers/mixin/export.dart';
import 'package:getx_base_code/presentation/journey/cart/cart_controller.dart';
import 'package:getx_base_code/presentation/journey/home/home_controller.dart';
import 'package:getx_base_code/presentation/journey/notification/notification_controller.dart';

class MainController extends GetxController with MixinController {
  RxInt rxCurrentNavIndex = 0.obs;

  void onChangedNav(int index) {
    rxCurrentNavIndex.value = index;
    if (index == 0) {
      Get.find<HomeController>().onRefresh(context);
    }
    if (index == 1) {
      Get.find<NotificationController>().onRefresh(context);
    }
    if (index == 2) {
      Get.find<CartController>().onRefresh(context);
    }
  }

  @override
  void onInit() {
    super.onInit();
    setStatusBarStyle(statusBarStyleType: StatusBarStyleType.dark);
  }
}
