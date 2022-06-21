import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_base_code/common/common_export.dart';
import 'package:getx_base_code/presentation/journey/auth/news/new_detail/new_detail_controller.dart';
import 'package:getx_base_code/presentation/theme/export.dart';
import 'package:getx_base_code/presentation/widgets/app_scaffold.dart';
import 'package:getx_base_code/presentation/widgets/appbar_widget.dart';

class NewDetailScreen extends GetView<NewDetailController> {
  const NewDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        appBar: AppBarWidget(
          title: Text(
            'Chi tiết',
            style: ThemeText.headline6
                .copyWith(fontSize: AppDimens.space_18, color: AppColors.white),
            textAlign: TextAlign.left,
          ),
          leading: AppBarButton(
            iconSource: ImageConstants.icArrowLeft,
            onTap: () => Get.back(),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppDimens.width_16)
              .copyWith(top: AppDimens.height_12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                controller.noti.title,
                style: ThemeText.subtitle1,
              ),
              SizedBox(
                height: AppDimens.height_12,
              ),
              Expanded(
                  child: Text(
                controller.noti.content,
                style: ThemeText.subtitle2,
              )),
            ],
          ),
        ));
  }
}
