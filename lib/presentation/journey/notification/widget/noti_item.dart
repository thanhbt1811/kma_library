import 'package:flutter/material.dart';
import 'package:getx_base_code/common/common_export.dart';
import 'package:getx_base_code/common/constants/format_constants.dart';
import 'package:getx_base_code/domain/models/notification_model.dart';
import 'package:getx_base_code/presentation/theme/export.dart';
import 'package:getx_base_code/presentation/widgets/app_image_widget.dart';
import 'package:getx_base_code/presentation/widgets/app_touchable.dart';

class NotiItem extends StatelessWidget {
  final NotificationModel noti;
  final Function() onDelete;
  const NotiItem({Key? key, required this.noti, required this.onDelete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.disableColor,
        borderRadius: BorderRadius.all(
          Radius.circular(AppDimens.radius_15),
        ),
      ),
      padding: EdgeInsets.all(AppDimens.height_12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Ngày ${dateFormatter(FormatConstants.formatddMMyyyyy, noti.sentDate)}',
                style:
                    ThemeText.subtitle2.copyWith(fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: AppDimens.height_12,
              ),
              Text(
                noti.content,
                style:
                    ThemeText.subtitle2.copyWith(fontWeight: FontWeight.w400),
              )
            ],
          ),
          AppTouchable(
            onPressed: onDelete,
            child: AppImageWidget(
                width: AppDimens.height_20,
                height: AppDimens.height_20,
                path: ImageConstants.icCircleClose,
                color: AppColors.black),
          )
        ],
      ),
    );
  }
}
