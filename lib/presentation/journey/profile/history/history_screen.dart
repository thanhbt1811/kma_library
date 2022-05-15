import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_base_code/common/common_export.dart';
import 'package:getx_base_code/presentation/journey/profile/history/widget/history_item.dart';
import 'package:getx_base_code/presentation/journey/profile/history_order/history_order_controller.dart';
import 'package:getx_base_code/presentation/theme/export.dart';
import 'package:getx_base_code/presentation/widgets/app_scaffold.dart';
import 'package:getx_base_code/presentation/widgets/appbar_widget.dart';

class HistoryScreen extends GetView<HistoryOrderController> {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBarWidget(
        title: Text(
          'Lịch sử mượn',
          style: ThemeText.headline6
              .copyWith(fontSize: AppDimens.space_18, color: AppColors.white),
          textAlign: TextAlign.left,
        ),
        leading: AppBarButton(
          iconSource: ImageConstants.icArrowLeft,
          onTap: () => Get.back(),
        ),
      ),
      backgroundColor: AppColors.white,
      body: ListView.separated(
          padding: EdgeInsets.symmetric(
              horizontal: AppDimens.width_16, vertical: AppDimens.height_16),
          itemBuilder: (context, index) => const HistoryItem(),
          separatorBuilder: (context, index) => SizedBox(
                height: AppDimens.height_16,
              ),
          itemCount: 20),
    );
  }
}
