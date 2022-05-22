import 'package:get/get.dart';
import 'package:getx_base_code/common/common_export.dart';
import 'package:getx_base_code/domain/models/book_model.dart';
import 'package:getx_base_code/domain/usecases/book_usecase.dart';
import 'package:getx_base_code/presentation/controllers/core_controller.dart';
import 'package:getx_base_code/presentation/journey/cart/cart_controller.dart';
import 'package:getx_base_code/presentation/widgets/export.dart';

class BookDetailController extends CoreController {
  final BookUsecase _bookUsecase;
  late BookModel book;

  BookDetailController(this._bookUsecase);
  @override
  void onInit() {
    book = Get.arguments[ArgumentConstants.book];
    super.onInit();
  }

  Future<void> addToCart() async {
    startLoading();
    await _bookUsecase.addToCart(book);
    finishLoading();
    showTopSnackBar(context,
        message: "Thêm vào giỏ mượn thành công", type: SnackBarType.done);
    final cartController = Get.find<CartController>();
    cartController.getCartList();
  }
}
