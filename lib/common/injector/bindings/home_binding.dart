import 'package:get/get.dart';
import 'package:getx_base_code/common/common_export.dart';
import 'package:getx_base_code/presentation/journey/home/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(getIt<HomeController>());
  }

}