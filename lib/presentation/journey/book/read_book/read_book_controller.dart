import 'package:get/get.dart';
import 'package:getx_base_code/common/constants/argument_constants.dart';
import 'package:getx_base_code/domain/models/book_model.dart';
import 'package:getx_base_code/presentation/controllers/core_controller.dart';

class ReadBookController extends CoreController {
  late Rx<BookModel> book;

  @override
  void onInit() {
    final BookModel arg = Get.arguments[ArgumentConstants.book];
    book = arg.obs;
    super.onInit();
  }
}
