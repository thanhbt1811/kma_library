import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:getx_base_code/common/common_export.dart';
import 'package:getx_base_code/presentation/theme/theme_color.dart';
import 'package:getx_base_code/presentation/theme/theme_text.dart';

class AppBarButton extends StatelessWidget {
  final Widget? child;

  final String? iconSource;
  final Color? iconColor;
  final Function()? onTap;
  final double? width;
  final double? height;

  const AppBarButton({
    Key? key,
    this.child,
    this.iconSource,
    this.onTap,
    this.width,
    this.height,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppDimens.height_40,
      width: AppDimens.height_40,
      child: InkWell(
        onTap: onTap,
        child: child ??
            Center(
              child: SvgPicture.asset(
                iconSource!,
                color: iconColor ?? Colors.white,
                width: width ?? AppDimens.width_9,
                height: height ?? AppDimens.height_18,
              ),
            ),
      ),
    );
  }
}

class AppBarWidget extends StatelessWidget implements PreferredSize {
  final Widget? leading;
  final Widget? action;
  final String? title;
  final Widget? centerWidget;
  final TextStyle? titleStyle;
  final Color? color;

  const AppBarWidget(
      {Key? key,
      this.leading,
      this.title,
      this.action,
      this.centerWidget,
      this.titleStyle,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _top = MediaQuery.of(context).padding.top;
    return Container(
      alignment: Alignment.center,
      color: color ?? AppColors.appbarColor,
      height: AppDimens.height_80,
      padding: EdgeInsets.only(top: _top),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          leading ??
              SizedBox(
                width: AppDimens.height_40,
                height: AppDimens.height_40,
              ),
          centerWidget ??
              Text(
                title ?? '',
                style: titleStyle ??
                    ThemeText.headline6.copyWith(
                        fontSize: AppDimens.space_18, color: AppColors.white),
                textAlign: TextAlign.left,
              ),
          action != null
              ? action!
              : SizedBox(
                  width: AppDimens.height_40,
                  height: AppDimens.height_40,
                ),
        ],
      ),
    );
  }

  @override
  Widget get child => Container();

  @override
  Size get preferredSize => Size.fromHeight(AppDimens.appBarHeight);
}
