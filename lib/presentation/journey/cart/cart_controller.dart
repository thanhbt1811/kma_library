import 'package:get/get.dart';
import 'package:getx_base_code/domain/usecases/book_usecase.dart';
import 'package:getx_base_code/presentation/controllers/core_controller.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CartController extends CoreController {
  final BookUsecase _bookUsecase;

  final RefreshController refreshController = RefreshController();
  final RxList rxBooks = [].obs;
  final int _pageSize = 10;
  int _page = 0;
  RxBool hasLoadMore = true.obs;

  CartController(this._bookUsecase);

  @override
  void onReady() {
    getCartList();
    super.onReady();
  }

  void getCartList() {
    startLoading();
    rxBooks.value = _bookUsecase.getCartList();
    finishLoading();
  }

  Future<void> onLoadmore() async {
    _page += 1;
    await _getBook(
      isLoadmore: true,
    );
    refreshController.loadComplete();
  }

  Future<void> _getBook({
    bool isLoadmore = false,
  }) async {
    if (!isLoadmore) {
      startLoading();
    }
    // final res = await _bookUsecase.getBooksWithCategory(
    //   context,
    //   _categoryId,
    //   _page,
    //   _pageSize,
    // );
    final res = [];
    if (!isLoadmore) {
      finishLoading();
    } else {
      refreshController.refreshCompleted();
    }

    if (res.isNotEmpty) {
      if (isLoadmore) {
        rxBooks.addAll(res);
      } else {
        rxBooks.value = res;
      }
      if (res.length <= _pageSize) {
        hasLoadMore.value = false;
      } else {
        hasLoadMore.value = true;
      }
    }
  }

  Future<void> onRefresh() async {
    _page = 0;
    rxBooks.clear();
    refreshController.refreshCompleted();
    await _getBook();
  }
}
