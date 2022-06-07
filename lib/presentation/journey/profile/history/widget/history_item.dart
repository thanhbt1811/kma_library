import 'package:flutter/material.dart';
import 'package:getx_base_code/common/common_export.dart';
import 'package:getx_base_code/common/constants/format_constants.dart';
import 'package:getx_base_code/domain/models/hire_model.dart';
import 'package:getx_base_code/presentation/theme/export.dart';
import 'package:getx_base_code/presentation/widgets/app_image_widget.dart';
import 'package:getx_base_code/presentation/widgets/snack_bar/app_snack_bar.dart';

class HistoryItem extends StatefulWidget {
  final HireModel hire;
  final int currentLenght;
  final String errorMessage;
  final Function(bool)? onLongPress;
  const HistoryItem({
    Key? key,
    required this.hire,
    this.onLongPress,
    required this.currentLenght,
    required this.errorMessage,
  }) : super(key: key);

  @override
  State<HistoryItem> createState() => _HistoryItemState();
}

class _HistoryItemState extends State<HistoryItem> {
  bool _isSelected = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
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
      child: Container(
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
                    path: widget.hire.thumbnail),
                SizedBox(
                  width: AppDimens.width_16,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.hire.title,
                      style: ThemeText.bodyText1,
                    ),
                    SizedBox(
                      height: AppDimens.height_8,
                    ),
                    Text(
                      'Ngày mượn: ${widget.hire.hiredFrom != null ? dateFormatter(FormatConstants.formatddMMyyyyy, widget.hire.hiredFrom!) : ''}',
                      style:
                          ThemeText.bodyText2.copyWith(color: AppColors.grey),
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
                  'Hạn trả: ${widget.hire.expiredDate != null ? dateFormatter(FormatConstants.formatddMMyyyyy, widget.hire.expiredDate!) : ""}',
                  style: ThemeText.bodyText2.copyWith(color: AppColors.grey),
                ),
                _isSelected
                    ? AppImageWidget(path: ImageConstants.icDone)
                    : const SizedBox.shrink(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
