import 'package:flutter/material.dart';
import 'package:getx_base_code/common/common_export.dart';
import 'package:getx_base_code/common/constants/format_constants.dart';
import 'package:getx_base_code/domain/models/hire_model.dart';
import 'package:getx_base_code/presentation/theme/export.dart';
import 'package:getx_base_code/presentation/widgets/app_image_widget.dart';

class HistoryItem extends StatelessWidget {
  final HireModel hire;
  const HistoryItem({Key? key, required this.hire}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.galleryApprox,
        borderRadius: BorderRadius.circular(AppDimens.radius_10),
      ),
      padding: EdgeInsets.all(AppDimens.width_12),
      child: Column(
        children: [
          Row(
            children: [
              AppImageWidget(
                  isBorder: true,
                  height: AppDimens.height_60,
                  width: AppDimens.width_80,
                  path: hire.thumbnail),
              SizedBox(
                width: AppDimens.width_16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    hire.title,
                    style: ThemeText.bodyText1,
                  ),
                  SizedBox(
                    height: AppDimens.height_8,
                  ),
                  Text(
                    'Ngày mượn: ',
                    style: ThemeText.bodyText2.copyWith(color: AppColors.grey),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: AppDimens.height_8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Hạn trả: ${hire.expiredDate != null ? dateFormatter(FormatConstants.formatddMMyyyyy, hire.expiredDate!) : ""}',
                style: ThemeText.bodyText2.copyWith(color: AppColors.grey),
              ),
              AppImageWidget(path: ImageConstants.icDone),
            ],
          ),
        ],
      ),
    );
  }
}
