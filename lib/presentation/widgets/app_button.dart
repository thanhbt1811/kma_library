import 'package:flutter/material.dart';
import 'package:getx_base_code/common/common_export.dart';
import 'package:getx_base_code/presentation/theme/export.dart';
import 'package:getx_base_code/presentation/widgets/app_loading_widget.dart';

class AppButton extends StatelessWidget {
  final String title;
  final LoadedType? loaded;
  final Color? backgroundColor;
  final Color? titleColor;
  final double? width;
  final Function()? onPressed;

  const AppButton({
    Key? key,
    required this.title,
    this.loaded = LoadedType.finish,
    this.backgroundColor = AppColors.second,
    this.titleColor = AppColors.white,
    this.width = double.infinity,
    this.onPressed,
  }) : super(key: key);
  factory AppButton.flexWidth({
    Key? key,
    required String title,
    double? width,
    Color? backgroundColor = AppColors.second,
    Color? titleColor = AppColors.white,
    Function()? onPressed,
    LoadedType loaded = LoadedType.finish,
  }) =>
      AppButton(
        key: key,
        title: title,
        width: width,
        backgroundColor: backgroundColor,
        titleColor: titleColor,
        onPressed: onPressed,
        loaded: loaded,
      );

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: width,
          height: AppDimens.height_52,
          child: TextButton(
            onPressed: () {
              hideKeyboard();
              if (!isNullEmpty(onPressed)) {
                onPressed!();
              }
            },
            style: ButtonStyle(
              textStyle: MaterialStateProperty.resolveWith(
                (states) => ThemeText.button,
              ),
              // padding: MaterialStateProperty.resolveWith(
              //   (states) => widget.padding,
              // ),
              enableFeedback: true,
              foregroundColor: MaterialStateColor.resolveWith(
                (states) =>
                    isNullEmpty(onPressed) ? titleColor! : AppColors.white,
              ),
              overlayColor: MaterialStateColor.resolveWith(
                (states) => AppColors.white.withOpacity(0.1),
              ),
              splashFactory: null,
              elevation: MaterialStateProperty.resolveWith(
                (states) => 0.0,
              ),
              backgroundColor: MaterialStateColor.resolveWith(
                (states) {
                  if (isNullEmpty(onPressed)) {
                    return AppColors.grey;
                  } else {
                    if (loaded == LoadedType.start) {
                      return backgroundColor!.withOpacity(0.7);
                    } else {
                      return backgroundColor!;
                    }
                  }
                },
              ),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppDimens.radius_12),
                ),
              ),
            ),
            child: loaded == LoadedType.start
                ? const SizedBox.shrink()
                : Text(title),
          ),
        ),
        loaded == LoadedType.start
            ? SizedBox(
                height: 60.h,
                child: const AppLoadingWidget(),
              )
            : const SizedBox.shrink()
      ],
    );
  }
}
