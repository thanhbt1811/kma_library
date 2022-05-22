import 'package:get/get.dart';
import 'package:getx_base_code/domain/models/user_model.dart';
import 'package:getx_base_code/presentation/controllers/app_controller.dart';
import 'package:getx_base_code/presentation/controllers/core_controller.dart';

class MyProfileController extends CoreController {
  late UserModel user;

  @override
  void onInit() {
    user = Get.find<AppController>().user;
    super.onInit();
  }
}
