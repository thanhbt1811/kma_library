import 'package:get/get.dart';
import 'package:getx_base_code/common/common_export.dart';
import 'package:getx_base_code/domain/models/book_model.dart';
import 'package:getx_base_code/domain/usecases/book_usecase.dart';
import 'package:getx_base_code/presentation/controllers/core_controller.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class BookListController extends CoreController {
  final BookUsecase _bookUsecase;
  final RefreshController refreshController = RefreshController();

  BookListController(this._bookUsecase);

  RxList<BookModel> rxBooks = <BookModel>[].obs;
  final int _pageSize = 10;
  int _page = 0;
  RxBool hasLoadMore = true.obs;
  late String _categoryId;

  @override
  void onInit() {
    _categoryId = Get.arguments[ArgumentConstants.categoryId];
    super.onInit();
  }

  @override
  void onReady() {
    _getBook();
    super.onReady();
  }

  @override
  void onClose() {
    refreshController.dispose();
    super.onClose();
  }

  Future<void> _getBook({bool isLoadmore = false}) async {
    if (!isLoadmore) {
      startLoading();
    }
    final res = await _bookUsecase.getBooksWithCategory(
        context, _categoryId, _page, _pageSize);
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

  Future<void> onLoadmore() async {
    _page += 1;
    await _getBook(
      isLoadmore: true,
    );
    refreshController.loadComplete();
  }

  Future<void> onRefresh() async {
    _page = 0;
    rxBooks.clear();
    refreshController.refreshCompleted();
    await _getBook();
  }
}
