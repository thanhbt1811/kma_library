import 'package:get/get.dart';
import 'package:getx_base_code/common/constants/argument_constants.dart';
import 'package:getx_base_code/domain/models/book_model.dart';
import 'package:getx_base_code/presentation/controllers/core_controller.dart';

class ReadBookController extends CoreController {
  late BookModel book;

  @override
  void onInit() {
    book = Get.arguments[ArgumentConstants.book];
    super.onInit();
  }
}
