import 'package:get/get.dart';
import 'package:getx_base_code/presentation/journey/cart/cart_controller.dart';

class CartBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      CartController(),
    );
  }
}
