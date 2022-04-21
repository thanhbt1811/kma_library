import 'package:flutter/material.dart';
import 'package:getx_base_code/common/common_export.dart';
import 'package:getx_base_code/presentation/theme/export.dart';
import 'package:getx_base_code/presentation/widgets/export.dart';

class AccountWidget extends StatelessWidget {
  const AccountWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppDimens.width_16)
          .copyWith(top: AppDimens.height_20),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              AppImageWidget(
                path: ImageConstants.icDefaultAvatar,
                height: AppDimens.height_120,
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  decoration: const BoxDecoration(
                    color: AppColors.white,
                    shape: BoxShape.circle,
                  ),
                  padding: EdgeInsets.all(AppDimens.height_8),
                  child: AppImageWidget(
                    path: ImageConstants.icCamera,
                    color: AppColors.disableColor,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            width: AppDimens.width_16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Bùi Tiến Thành',
                style: ThemeText.subtitle1,
              ),
              SizedBox(height: AppDimens.height_4),
              Text(
                'Khoa: An Toàn Thông Tin',
                style:
                    ThemeText.subtitle2.copyWith(fontWeight: FontWeight.w400),
              ),
              SizedBox(height: AppDimens.height_4),
              Text(
                'Mã sinh viên: AT150350',
                style:
                    ThemeText.subtitle2.copyWith(fontWeight: FontWeight.w400),
              ),
            ],
          )
        ],
      ),
    );
  }
}
