import 'package:get/get.dart';
import 'package:getx_base_code/common/injector/locators/app_locator.dart';
import 'package:getx_base_code/presentation/journey/profile/history/history_controller.dart';
import 'package:getx_base_code/presentation/journey/profile/my_profile/my_profile_controller.dart';
import 'package:getx_base_code/presentation/journey/profile/profile_controller.dart';
import 'package:getx_base_code/presentation/journey/profile/returned/returned_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      getIt<ProfileController>(),
    );
  }
}

class ReturnedBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(
      getIt<ReturnedController>(),
    );
  }
}

class HistoryBidings extends Bindings {
  @override
  void dependencies() {
    Get.put(
      getIt<HistoryController>(),
    );
  }
}

class MyProfileBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(
      getIt<MyProfileController>(),
    );
  }
}
