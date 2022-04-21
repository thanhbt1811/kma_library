import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:getx_base_code/common/constants/app_dimens.dart';
import 'package:getx_base_code/common/utils/export.dart';
import 'package:getx_base_code/presentation/theme/export.dart';
import 'package:getx_base_code/presentation/widgets/export.dart';

class AppObscureFieldWidget extends StatefulWidget {
  final bool readOnly;
  final String? hintText;
  final String? errorText;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String)? onChanged;
  final Function()? onPressed;
  final Color? shadowColor;
  final double? elevation;
  final Widget? prefixIcon;

  const AppObscureFieldWidget({
    Key? key,
    this.readOnly = false,
    this.hintText,
    this.errorText,
    this.controller,
    this.focusNode,
    this.keyboardType = TextInputType.text,
    this.inputFormatters,
    this.onChanged,
    this.onPressed,
    this.shadowColor,
    this.elevation,
    this.prefixIcon,
  }) : super(key: key);

  @override
  _AppObscureFieldWidgetState createState() => _AppObscureFieldWidgetState();
}

class _AppObscureFieldWidgetState extends State<AppObscureFieldWidget> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return AppTextFieldWidget(
      readOnly: widget.readOnly,
      hintText: widget.hintText ?? 'Mật khẩu',
      errorText: widget.errorText,
      controller: widget.controller,
      focusNode: widget.focusNode,
      keyboardType: widget.keyboardType,
      onChanged: widget.onChanged,
      onPressed: widget.onPressed,
      obscureText: obscureText,
      elevation: widget.elevation,
      shadowColor: widget.shadowColor,
      prefixIcon: widget.prefixIcon,
      suffixIcon: AppTouchable(
        padding: EdgeInsets.all(AppDimens.space_8),
        onPressed: () {
          setState(() {
            obscureText = !obscureText;
          });
        },
        child: Icon(
          obscureText ? Icons.visibility : Icons.visibility_off_rounded,
          color: AppColors.grey,
          size: AppDimens.space_20,
        ),
      ),
    );
  }
}
