import 'package:flutter/material.dart';
import 'package:getx_base_code/common/common_export.dart';
import 'package:getx_base_code/presentation/theme/export.dart';
import 'package:getx_base_code/presentation/widgets/app_image_widget.dart';

class BookWidget extends StatelessWidget {
  final bool showStar;
  final bool showRecycleBin;
  const BookWidget(
      {Key? key, this.showRecycleBin = false, this.showStar = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          height: AppDimens.height_120,
          width: AppDimens.width_40,
          alignment: Alignment.bottomLeft,
          decoration: const BoxDecoration(
            color: AppColors.grey,
            borderRadius: BorderRadius.all(
              Radius.circular(AppDimens.radius_10),
            ),
          ),
          padding: EdgeInsets.symmetric(
              horizontal: AppDimens.width_8, vertical: AppDimens.height_4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Visibility(
                visible: showStar,
                child: AppImageWidget(
                  path: ImageConstants.icStar,
                  color: AppColors.second,
                ),
              ),
              Visibility(
                visible: showRecycleBin,
                child: AppImageWidget(
                  path: ImageConstants.icRecycleBin,
                  color: AppColors.red,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: AppDimens.height_16,
        ),
        Text(
          'Giáo trình lập trình C căn bản',
          style: ThemeText.bodyText1.copyWith(color: AppColors.appbarColor),
        )
      ],
    );
  }
}
