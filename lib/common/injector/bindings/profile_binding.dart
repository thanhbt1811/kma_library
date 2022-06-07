import 'package:get/get.dart';
import 'package:getx_base_code/common/injector/locators/app_locator.dart';
import 'package:getx_base_code/presentation/journey/profile/estimate_return_book/estimate_return_book_controller.dart';
import 'package:getx_base_code/presentation/journey/profile/estimating_book/estimating_book_controller.dart';
import 'package:getx_base_code/presentation/journey/profile/history/history_controller.dart';
import 'package:getx_base_code/presentation/journey/profile/my_profile/my_profile_controller.dart';
import 'package:getx_base_code/presentation/journey/profile/profile_controller.dart';
import 'package:getx_base_code/presentation/journey/profile/returned/returned_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyReplace(() => getIt<ProfileController>(), fenix: true);
  }
}

class ReturnedBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyReplace(() => getIt<ReturnedController>(), fenix: true);
  }
}

class HistoryBidings extends Bindings {
  @override
  void dependencies() {
    Get.lazyReplace(
      () => getIt<HistoryController>(),
      fenix: true,
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

class EstimatingBookBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyReplace(() => getIt<EstimatingBookController>(), fenix: true);
  }
}

class EstimateReturnBookBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyReplace(() => getIt<EstimateReturnBookController>(), fenix: true);
  }
}
