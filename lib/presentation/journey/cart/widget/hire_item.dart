import 'package:flutter/material.dart';
import 'package:getx_base_code/common/common_export.dart';
import 'package:getx_base_code/domain/models/hire_model.dart';
import 'package:getx_base_code/presentation/theme/export.dart';
import 'package:getx_base_code/presentation/widgets/export.dart';

class HireItem extends StatefulWidget {
  final HireModel hire;
  final int currentLenght;
  final String errorMessage;
  final Function() onPressed;
  final Function(bool)? onLongPress;
  const HireItem({
    Key? key,
    required this.hire,
    required this.currentLenght,
    required this.onPressed,
    required this.errorMessage,
    this.onLongPress,
  }) : super(key: key);

  @override
  State<HireItem> createState() => _HireItemState();
}

class _HireItemState extends State<HireItem> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      onLongPress: () {
        setState(() {
          _isSelected = (!_isSelected) && widget.currentLenght < 7;
          if (widget.currentLenght >= 5) {
            showTopSnackBar(context, message: widget.errorMessage);
          }
          if (widget.onLongPress != null) {
            widget.onLongPress!(_isSelected);
          }
        });
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              AppImageWidget(
                height: AppDimens.height_120,
                path: widget.hire.thumbnail,
                isBorder: true,
              ),
              _isSelected
                  ? Align(
                      alignment: Alignment.topRight,
                      child: AppImageWidget(path: ImageConstants.icDone),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
          SizedBox(
            height: AppDimens.height_8,
          ),
          Expanded(
            child: Text(
              widget.hire.title,
              style: ThemeText.subtitle2.copyWith(color: AppColors.appbarColor),
            ),
          )
        ],
      ),
    );
  }
}
