import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_base_code/common/common_export.dart';
import 'package:getx_base_code/domain/models/cateogory_model.dart';
import 'package:getx_base_code/domain/usecases/category_usecase.dart';
import 'package:getx_base_code/presentation/controllers/core_controller.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeController extends CoreController {
  final CategoryUsecase _categoryUsecase;
  final RefreshController refreshController = RefreshController();
  RxList<CategoryModel> categories = <CategoryModel>[].obs;
  final int _pageSize = 10;
  int _page = 0;
  RxBool hasLoadMore = true.obs;

  HomeController(this._categoryUsecase);

  @override
  void onReady() {
    getCategories();
    super.onReady();
  }

  @override
  void onClose() {
    refreshController.dispose();
    super.onClose();
  }

  Future<void> getCategories({bool isLoadmore = false}) async {
    if (!isLoadmore) {
      rxLoadedType.value = LoadedType.start;
    }
    final res = await _categoryUsecase.getCategories(context, _page, _pageSize);
    if (!isLoadmore) {
      rxLoadedType.value = LoadedType.finish;
    } else {
      refreshController.refreshCompleted();
    }

    if (res.isNotEmpty) {
      if (isLoadmore) {
        categories.addAll(res);
      } else {
        categories.value = res;
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
    await getCategories(
      isLoadmore: true,
    );
    refreshController.loadComplete();
  }

  Future<void> onRefresh(BuildContext context) async {
    _page = 0;
    this.context = context;
    categories.clear();
    refreshController.refreshCompleted();
    await getCategories();
  }
}
