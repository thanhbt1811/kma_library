import 'package:get/get.dart';
import 'package:getx_base_code/common/common_export.dart';
import 'package:getx_base_code/domain/models/new_model.dart';
import 'package:getx_base_code/presentation/controllers/core_controller.dart';

class NewDetailController extends CoreController {
  late final NewModel noti;

  @override
  void onInit() {
    noti = Get.arguments[ArgumentConstants.newModel];
    super.onInit();
  }
}
