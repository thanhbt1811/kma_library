import 'package:get/get.dart';
import 'package:getx_base_code/common/common_export.dart';
import 'package:getx_base_code/common/extensions/calender_extensions.dart';
import 'package:getx_base_code/domain/models/hire_model.dart';
import 'package:getx_base_code/domain/usecases/book_usecase.dart';
import 'package:getx_base_code/presentation/controllers/core_controller.dart';
import 'package:getx_base_code/presentation/widgets/snack_bar/app_snack_bar.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HistoryController extends CoreController {
  final BookUsecase _bookUsecase;
  final RefreshController refreshController = RefreshController();
  RxMap<DateTime, List<HireModel>> hirings = <DateTime, List<HireModel>>{}.obs;
  RxList<String> returnedBookId = <String>[].obs;
  Rx<Calender> rxCalender = Calender.morning.obs;
  Rx<DateTime> rxDate = DateTime.now().obs;
  final int _pageSize = 10;
  int _page = 0;
  RxBool hasLoadMore = true.obs;
  Rx<LoadedType> loadingEstimateReturn = LoadedType.finish.obs;

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
        var mergedMap = <DateTime, List<HireModel>>{};
        for (var map in [hirings, res]) {
          for (var entry in map.entries) {
            // Add an empty `List` to `mergedMap` if the key doesn't already exist
            // and then merge the `List`s.
            (mergedMap[entry.key] ??= []).addAll(entry.value);
          }
        }
        hirings.value = mergedMap;
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

  Future<void> returnedBook() async {
    loadingEstimateReturn.value = LoadedType.start;
    final date = rxDate.value;
    final estaimationHiredDate = DateTime(date.year, date.month, date.day,
        rxCalender.value.time.hour, rxCalender.value.time.minute);
    final res = await _bookUsecase.estaimateReturnDate(
        context, estaimationHiredDate, returnedBookId);
    if (res) {
      onRefresh();
      showTopSnackBar(context,
          message: 'Đặt lịch trả sách thành công', type: SnackBarType.done);
    }
    loadingEstimateReturn.value = LoadedType.finish;
  }
}
