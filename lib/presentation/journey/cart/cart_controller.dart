import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_base_code/common/constants/constants_export.dart';
import 'package:getx_base_code/common/extensions/calender_extensions.dart';
import 'package:getx_base_code/domain/models/hire_model.dart';
import 'package:getx_base_code/domain/usecases/book_usecase.dart';
import 'package:getx_base_code/presentation/controllers/core_controller.dart';
import 'package:getx_base_code/presentation/widgets/export.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CartController extends CoreController {
  final BookUsecase _bookUsecase;

  final RefreshController refreshController = RefreshController();
  final RxList<HireModel> rxBooks = <HireModel>[].obs;
  final int _pageSize = 10;
  int _page = 0;
  RxBool hasLoadMore = true.obs;
  Rx<Calender> rxCalender = Calender.morning.obs;
  Rx<DateTime> hireDate = DateTime.now().obs;
  final RxList<String> hireList = <String>[].obs;
  final Rx<LoadedType> deleteLoaded = LoadedType.finish.obs;

  CartController(this._bookUsecase);

  @override
  void onReady() {
    getCartList();
    super.onReady();
  }

  void getCartList() {
    startLoading();
    finishLoading();
  }

  Future<void> onLoadmore() async {
    _page += 1;
    await _getBook(
      isLoadmore: true,
    );
    refreshController.loadComplete();
  }

  void addHireBook(String id) {
    if (hireList.length >= 5) {
      showTopSnackBar(context, message: 'Chỉ có thể mượn tối đa 7 quyển sách');
    } else {
      hireList.add(id);
    }
  }

  Future<void> _getBook({
    bool isLoadmore = false,
  }) async {
    if (!isLoadmore) {
      startLoading();
    }
    final res = await _bookUsecase.getEstimatingBook(
      context,
      _page,
      _pageSize,
    );
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

  Future<void> onRefresh(BuildContext context) async {
    _page = 0;
    this.context = context;
    rxBooks.clear();
    refreshController.refreshCompleted();
    await _getBook();
  }

  Future<void> hireBook() async {
    startLoading();
    final date = hireDate.value;
    final estaimationHiredDate = DateTime(date.year, date.month, date.day,
        rxCalender.value.time.hour, rxCalender.value.time.minute);
    final res =
        await _bookUsecase.hiringBook(context, estaimationHiredDate, hireList);
    if (res) {
      onRefresh(context);
      showTopSnackBar(context,
          message: 'Đặt lịch mượn sách thành công', type: SnackBarType.done);
    }
    finishLoading();
  }

  Future<void> deleteBook() async {
    deleteLoaded.value = LoadedType.start;
    final res = await _bookUsecase.deleteBookFromCart(context, hireList);
    if (res) {
      showTopSnackBar(context,
          message: 'Xóa thành công', type: SnackBarType.done);
      onRefresh(context);
    }
    deleteLoaded.value = LoadedType.finish;
  }
}
