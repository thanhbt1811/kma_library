import 'package:get/get.dart';
import 'package:getx_base_code/common/common_export.dart';
import 'package:getx_base_code/domain/models/new_model.dart';
import 'package:getx_base_code/domain/usecases/notification_usecase.dart';
import 'package:getx_base_code/presentation/controllers/core_controller.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class NewsController extends CoreController {
  final NotificationUsecase _notificationUsecase;
  final RefreshController refreshController = RefreshController();
  RxList<NewModel> noties = <NewModel>[].obs;
  final int _pageSize = 10;
  int _page = 0;
  RxBool hasLoadMore = true.obs;

  NewsController(this._notificationUsecase);

  @override
  void onReady() {
    _getNotiBook();
    super.onReady();
  }

  @override
  void onClose() {
    refreshController.dispose();
    super.onClose();
  }

  Future<void> _getNotiBook({bool isLoadmore = false}) async {
    if (!isLoadmore) {
      rxLoadedType.value = LoadedType.start;
    }
    final res = await _notificationUsecase.getNews(context, _page, _pageSize);
    if (!isLoadmore) {
      rxLoadedType.value = LoadedType.finish;
    } else {
      refreshController.refreshCompleted();
    }

    if (res.isNotEmpty) {
      if (isLoadmore) {
        noties.addAll(res);
      } else {
        noties.value = res;
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
    await _getNotiBook(
      isLoadmore: true,
    );
    refreshController.loadComplete();
  }

  Future<void> onRefresh() async {
    _page = 0;
    noties.clear();
    refreshController.refreshCompleted();
    await _getNotiBook();
  }
}
