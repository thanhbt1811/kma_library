import 'package:get/get.dart';
import 'package:getx_base_code/common/common_export.dart';
import 'package:getx_base_code/domain/models/hire_model.dart';
import 'package:getx_base_code/domain/usecases/book_usecase.dart';
import 'package:getx_base_code/presentation/controllers/core_controller.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HistoryController extends CoreController {
  final BookUsecase _bookUsecase;
  final RefreshController refreshController = RefreshController();
  RxList<HireModel> hirings = <HireModel>[].obs;
  final int _pageSize = 10;
  int _page = 0;
  RxBool hasLoadMore = true.obs;

  HistoryController(this._bookUsecase);

  @override
  void onReady() {
    _getHiringBook();
    super.onReady();
  }

  @override
  void onClose() {
    refreshController.dispose();
    super.onClose();
  }

  Future<void> _getHiringBook({bool isLoadmore = false}) async {
    if (!isLoadmore) {
      rxLoadedType.value = LoadedType.start;
    }
    final res = await _bookUsecase.getHiringBook(context, _page, _pageSize);
    if (!isLoadmore) {
      rxLoadedType.value = LoadedType.finish;
    } else {
      refreshController.refreshCompleted();
    }

    if (res.isNotEmpty) {
      if (isLoadmore) {
        hirings.addAll(res);
      } else {
        hirings.value = res;
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
    await _getHiringBook(
      isLoadmore: true,
    );
    refreshController.loadComplete();
  }

  Future<void> onRefresh() async {
    _page = 0;
    hirings.clear();
    refreshController.refreshCompleted();
    await _getHiringBook();
  }
}
