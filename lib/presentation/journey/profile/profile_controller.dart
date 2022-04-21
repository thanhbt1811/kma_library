import 'package:get/get.dart';
import 'package:getx_base_code/presentation/controllers/core_controller.dart';

class ProfileController extends CoreController {
  RxBool rxActiveNoti = false.obs;

  void setRxActiveNoti() {
    rxActiveNoti.value = !rxActiveNoti.value;
  }
}
