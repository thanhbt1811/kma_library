import 'package:flutter/material.dart';
import 'package:getx_base_code/common/common_export.dart';
import 'package:getx_base_code/presentation/theme/export.dart';
import 'package:getx_base_code/presentation/widgets/app_image_widget.dart';

class MenuItemWidget extends StatelessWidget {
  final String title;
  final Function() onTap;
  final Widget? action;
  final TextStyle? textStyle;
  const MenuItemWidget(
      {Key? key,
      required this.title,
      required this.onTap,
      this.action,
      this.textStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: AppDimens.height_60,
        padding: EdgeInsets.symmetric(horizontal: AppDimens.width_16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: textStyle ??
                  ThemeText.subtitle1.copyWith(fontWeight: FontWeight.w400),
            ),
            action ??
                AppImageWidget(
                  path: ImageConstants.icArrowRight,
                  height: AppDimens.height_18,
                  width: AppDimens.height_18,
                )
          ],
        ),
      ),
    );
  }
}
