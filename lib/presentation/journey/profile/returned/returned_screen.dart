import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_base_code/common/common_export.dart';
import 'package:getx_base_code/presentation/journey/profile/returned/returned_controller.dart';
import 'package:getx_base_code/presentation/journey/profile/returned/widget/returned_group_widget.dart';
import 'package:getx_base_code/presentation/theme/export.dart';
import 'package:getx_base_code/presentation/widgets/app_empty_widget.dart';
import 'package:getx_base_code/presentation/widgets/app_refresh_widget.dart';
import 'package:getx_base_code/presentation/widgets/app_scaffold.dart';
import 'package:getx_base_code/presentation/widgets/appbar_widget.dart';
import 'package:getx_base_code/presentation/widgets/export.dart';
import 'package:getx_base_code/presentation/widgets/list_shimmer/list_shimmer_widget.dart';

List<String> title = ["Nghệ thuật khắc kỷ", "Nghệ thuật khắc kỷ", "Toán A1"];
List<String> returnedDate = ["30/3/2022", "13/5/2022", "20/5/2022"];

class ReturnedScreen extends GetView<ReturnedController> {
  const ReturnedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.context = context;
    return AppScaffold(
      appBar: AppBarWidget(
        title: Text(
          'Sách đã trả',
          style: ThemeText.headline6
              .copyWith(fontSize: AppDimens.space_18, color: AppColors.white),
          textAlign: TextAlign.left,
        ),
        leading: AppBarButton(
          iconSource: ImageConstants.icArrowLeft,
          onTap: () => Get.back(id: BottomNavigationType.profile.index),
        ),
      ),
      backgroundColor: AppColors.white,
      body: Obx(
        () => AppRefreshWidget(
          enableLoadMore: controller.hasLoadMore.value,
          onRefresh: controller.onRefresh,
          onLoadMore: controller.onLoadmore,
          controller: controller.refreshController,
          child: _buildHistoryList(),
          footer: AppLoadingWidget(
            width: AppDimens.height_20,
          ),
        ),
      ),
    );
  }

  Widget _buildHistoryList() {
    if (controller.rxLoadedType.value == LoadedType.start) {
      return const ListShimmerWidget();
    } else if (controller.hirings.isEmpty) {
      return const Center(child: AppEmptyWidget());
    } else {
      final returnedDates = controller.hirings.keys.toList();
      return ListView.separated(
          padding: EdgeInsets.symmetric(
              horizontal: AppDimens.width_16, vertical: AppDimens.height_16),
          itemBuilder: (context, index) {
            final returnedDate = returnedDates[index];
            final returnedList = controller.hirings[returnedDate];
            return ReturnedGroupWidget(
                returnedDate: returnedDate, returnedList: returnedList ?? []);
          },
          separatorBuilder: (context, index) => SizedBox(
                height: AppDimens.height_16,
              ),
          itemCount: returnedDates.length);
    }
  }
}
