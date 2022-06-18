import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_base_code/common/common_export.dart';
import 'package:getx_base_code/common/utils/comon_utils.dart';
import 'package:getx_base_code/presentation/journey/cart/widget/hire_widget.dart';
import 'package:getx_base_code/presentation/journey/profile/history/history_controller.dart';
import 'package:getx_base_code/presentation/journey/profile/history/widget/history_item.dart';
import 'package:getx_base_code/presentation/theme/export.dart';
import 'package:getx_base_code/presentation/widgets/app_empty_widget.dart';
import 'package:getx_base_code/presentation/widgets/app_refresh_widget.dart';
import 'package:getx_base_code/presentation/widgets/app_scaffold.dart';
import 'package:getx_base_code/presentation/widgets/appbar_widget.dart';
import 'package:getx_base_code/presentation/widgets/export.dart';
import 'package:getx_base_code/presentation/widgets/list_shimmer/list_shimmer_widget.dart';

class HistoryScreen extends GetView<HistoryController> {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.context = context;
    return AppScaffold(
      appBar: AppBarWidget(
        title: Text(
          'Sách đang mượn',
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
      body: Column(
        children: [
          Expanded(
            child: Obx(
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
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppDimens.width_16),
            child: Obx(
              () => AppButton(
                title: 'Đặt lịch trả sách',
                loaded: controller.rxLoadedType.value,
                onPressed: controller.returnedBookId.isNotEmpty
                    ? () => _returnBook(context)
                    : null,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          )
        ],
      ),
    );
  }

  void _returnBook(BuildContext context) {
    CommonUtils.showAppDialog(
        context: context,
        body: Obx(
          () => HireWidget(
            calender: controller.rxCalender.value,
            currentDate: controller.rxDate.value,
            onDone: () {
              Get.back();
              controller.returnedBook();
            },
            onSelectCalender: (calender) {
              controller.rxCalender.value = calender;
            },
            onSelectDate: (date) {
              controller.rxDate.value = date;
            },
          ),
        ));
  }

  Widget _buildHistoryList() {
    if (controller.rxLoadedType.value == LoadedType.start) {
      return const ListShimmerWidget();
    } else if (controller.hirings.isEmpty) {
      return const Center(child: AppEmptyWidget());
    } else {
      final hires = controller.hirings;
      return ListView.separated(
          padding: EdgeInsets.symmetric(
              horizontal: AppDimens.width_16, vertical: AppDimens.height_16),
          itemBuilder: (context, index) {
            final hire = hires[index];
            return HistoryItem(
              hire: hire,
              onLongPress: (value) {
                if (value) {
                  controller.returnedBookId.add(hire.id);
                } else {
                  controller.returnedBookId.remove(hire.id);
                }
              },
              currentLenght: controller.returnedBookId.length,
              errorMessage: "Chỉ có thể trả tối đa 7 quyển sách",
            );
          },
          separatorBuilder: (context, index) => SizedBox(
                height: AppDimens.height_16,
              ),
          itemCount: hires.length);
    }
  }
}
