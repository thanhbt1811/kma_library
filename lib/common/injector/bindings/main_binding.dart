import 'package:get/get.dart';
import 'package:getx_base_code/presentation/journey/main/main_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      MainController(),
    );
  }
}
