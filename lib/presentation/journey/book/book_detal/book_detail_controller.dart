import 'package:get/get.dart';
import 'package:getx_base_code/common/common_export.dart';
import 'package:getx_base_code/domain/models/book_model.dart';
import 'package:getx_base_code/domain/usecases/book_usecase.dart';
import 'package:getx_base_code/presentation/controllers/core_controller.dart';
import 'package:getx_base_code/presentation/journey/cart/cart_controller.dart';
import 'package:getx_base_code/presentation/widgets/export.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class BookDetailController extends CoreController {
  final RefreshController refreshController = RefreshController();
  final BookUsecase _bookUsecase;
  late BookModel book;
  RxList<BookModel> books = <BookModel>[].obs;
  final int _pageSize = 10;
  int _page = 0;
  RxBool hasLoadMore = true.obs;
  RxBool activeButton = false.obs;
  Rx<LoadedType> bookListLoading = LoadedType.finish.obs;

  BookDetailController(this._bookUsecase);
  @override
  void onInit() {
    book = Get.arguments[ArgumentConstants.book];
    activeButton.value = book.quantity != 0;
    super.onInit();
  }

  @override
  void onReady() {
    _getBooks();
    super.onReady();
  }

  Future<void> _getBooks({bool isLoadmore = false}) async {
    if (!isLoadmore) {
      bookListLoading.value = LoadedType.start;
    }
    final res =
        await _bookUsecase.getBookInTerm(context, book.term, _page, _pageSize);
    if (!isLoadmore) {
      bookListLoading.value = LoadedType.finish;
    } else {
      refreshController.refreshCompleted();
    }

    if (res.isNotEmpty) {
      if (isLoadmore) {
        books.addAll(res);
      } else {
        books.value = res;
      }
      if (res.length <= _pageSize) {
        hasLoadMore.value = false;
      } else {
        hasLoadMore.value = true;
      }
    }
  }

  Future<void> onLoadmore() async {
    _page += 1;
    await _getBooks(
      isLoadmore: true,
    );
    refreshController.loadComplete();
  }

  Future<void> onRefresh() async {
    _page = 0;
    books.clear();
    refreshController.refreshCompleted();
    await _getBooks();
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
