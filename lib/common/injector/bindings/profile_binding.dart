import 'package:get/get.dart';
import 'package:getx_base_code/presentation/journey/profile/change_password/change_password_controller.dart';
import 'package:getx_base_code/presentation/journey/profile/history/history_controller.dart';
import 'package:getx_base_code/presentation/journey/profile/history_order/history_order_controller.dart';
import 'package:getx_base_code/presentation/journey/profile/profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      ProfileController(),
    );
    Get.put(
      ChangePasswordController(),
    );
    Get.put(
      HistoryOrderController(),
    );
    Get.put(
      HistoryController(),
    );
  }
}
