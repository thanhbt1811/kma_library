import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_base_code/common/common_export.dart';
import 'package:getx_base_code/presentation/journey/notification/notification_controller.dart';
import 'package:getx_base_code/presentation/journey/notification/widget/noti_item.dart';
import 'package:getx_base_code/presentation/theme/export.dart';
import 'package:getx_base_code/presentation/widgets/app_scaffold.dart';
import 'package:getx_base_code/presentation/widgets/appbar_widget.dart';

class NotificationScreen extends GetView<NotificationController> {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBarWidget(
        title: Text(
          'Thông báo',
          style: ThemeText.headline6
              .copyWith(fontSize: AppDimens.space_18, color: AppColors.white),
          textAlign: TextAlign.left,
        ),
      ),
      body: ListView.separated(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(
              horizontal: AppDimens.width_16, vertical: AppDimens.height_16),
          itemBuilder: (context, index) {
            return const NotiItem();
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              height: AppDimens.height_20,
            );
          },
          itemCount: 20),
    );
  }
}
