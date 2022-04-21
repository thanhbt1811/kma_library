import 'package:flutter/material.dart';
import 'package:getx_base_code/common/common_export.dart';
import 'package:getx_base_code/presentation/theme/export.dart';
import 'package:getx_base_code/presentation/widgets/app_image_widget.dart';

class HistoryItem extends StatelessWidget {
  const HistoryItem({Key? key}) : super(key: key);

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
              Container(
                width: AppDimens.width_80,
                height: AppDimens.height_60,
                decoration: const BoxDecoration(
                    color: AppColors.second,
                    borderRadius: BorderRadius.all(
                      Radius.circular(AppDimens.radius_20),
                    )),
              ),
              SizedBox(
                width: AppDimens.width_16,
              ),
              Column(
                children: [
                  Text(
                    'Hệ quản trị cơ sở dữ liệu',
                    style: ThemeText.bodyText1,
                  ),
                  SizedBox(
                    height: AppDimens.height_8,
                  ),
                  Text(
                    'Ngày mượn: 12:30 20/5/2022',
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
                'Hạn trả: 12:30 20/8/2022',
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
