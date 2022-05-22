import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:getx_base_code/common/common_export.dart';
import 'package:getx_base_code/presentation/theme/export.dart';

import '../export.dart';

class AppTextFieldWidget extends StatefulWidget {
  final bool readOnly;
  final bool obscureText;
  final String? hintText;
  final String? errorText;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String)? onChanged;
  final Function()? onPressed;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? shadowColor;
  final double? elevation;

  const AppTextFieldWidget({
    Key? key,
    this.readOnly = false,
    this.obscureText = false,
    this.hintText,
    this.errorText,
    this.controller,
    this.focusNode,
    this.keyboardType = TextInputType.text,
    this.inputFormatters,
    this.onChanged,
    this.onPressed,
    this.suffixIcon,
    this.prefixIcon,
    this.backgroundColor,
    this.borderColor,
    this.shadowColor,
    this.elevation,
  }) : super(key: key);

  @override
  _AppTextFieldWidgetState createState() => _AppTextFieldWidgetState();
}

class _AppTextFieldWidgetState extends State<AppTextFieldWidget> {
  bool _isShowClose = false;

  inputBorder({Color? color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppDimens.radius_40),
      borderSide: BorderSide(color: color ?? AppColors.white),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        AppTouchable(
          onPressed: widget.readOnly ? () {} : null,
          child: Material(
            color: widget.backgroundColor ?? AppColors.white,
            borderRadius: BorderRadius.circular(AppDimens.radius_40),
            elevation: widget.elevation ?? 0.0,
            shadowColor: widget.shadowColor,
            child: Stack(
              children: [
                TextFormField(
                  obscureText: widget.obscureText,
                  readOnly: widget.readOnly,
                  controller: widget.controller,
                  focusNode: widget.focusNode,
                  style: ThemeText.bodyText2,
                  keyboardType: widget.keyboardType,
                  inputFormatters: widget.inputFormatters,
                  onChanged: (value) {
                    if (!isNullEmpty(widget.onChanged)) {
                      widget.onChanged!(value);
                    }
                    setState(() {
                      if (!isNullEmpty(value)) {
                        _isShowClose = true;
                      } else {
                        _isShowClose = false;
                      }
                    });
                  },
                  decoration: InputDecoration(
                    hintText: widget.hintText,
                    hintStyle: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(color: AppColors.grey),
                    prefixIcon: !isNullEmpty(widget.prefixIcon)
                        ? SizedBox(
                            width: AppDimens.width_12,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: AppDimens.space_8,
                                ),
                                widget.prefixIcon!,
                              ],
                            ),
                          )
                        : const SizedBox.shrink(),
                    suffixIcon: SizedBox(
                      width: 80.sp,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          _isShowClose
                              ? AppTouchable(
                                  padding: EdgeInsets.all(AppDimens.space_8),
                                  onPressed: () {
                                    setState(() {
                                      _isShowClose = false;
                                      widget.controller?.clear();
                                    });
                                    if (!isNullEmpty(widget.onChanged)) {
                                      widget.onChanged!('');
                                    }
                                  },
                                  child: AppImageWidget(
                                    path: ImageConstants.icCircleClose,
                                    color: AppColors.grey,
                                    width: AppDimens.space_16,
                                    height: AppDimens.space_16,
                                  ),
                                )
                              : const SizedBox.shrink(),
                          !isNullEmpty(widget.suffixIcon)
                              ? widget.suffixIcon!
                              : const SizedBox.shrink(),
                          SizedBox(
                            width: AppDimens.space_8,
                          ),
                        ],
                      ),
                    ),
                    isDense: false,
                    contentPadding: EdgeInsets.symmetric(
                      vertical: AppDimens.space_16,
                      horizontal: AppDimens.space_16,
                    ),
                    enabledBorder: inputBorder(
                        color: widget.borderColor ?? AppColors.white),
                    disabledBorder: InputBorder.none,
                    focusedBorder: inputBorder(
                        color: widget.borderColor ?? AppColors.white),
                    errorBorder: inputBorder(color: AppColors.red),
                    focusedErrorBorder: inputBorder(
                        color: widget.borderColor ?? AppColors.white),
                    border: InputBorder.none,
                  ),
                ),
                widget.readOnly
                    ? Positioned.fill(
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            highlightColor: AppColors.transparent,
                            splashColor: AppColors.transparent,
                            customBorder: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(AppDimens.radius_12)),
                            onTap: widget.onPressed,
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          ),
        ),
        widget.errorText != null
            ? Container(
                height: AppDimens.height_24,
                padding: EdgeInsets.symmetric(
                  // vertical: AppDimens.space_8,
                  horizontal: AppDimens.space_16,
                ),
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.errorText!,
                  style: Theme.of(context)
                      .textTheme
                      .caption!
                      .copyWith(color: AppColors.red),
                ),
              )
            : const SizedBox()
      ],
    );
  }
}
