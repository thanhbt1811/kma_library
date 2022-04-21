import 'package:get/get.dart';
import 'package:getx_base_code/presentation/journey/favorite/favorite_controller.dart';

class FavoriteBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      FavoriteController(),
    );
  }
}
