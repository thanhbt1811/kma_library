import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_base_code/common/constants/app_dimens.dart';
import 'package:getx_base_code/presentation/theme/export.dart';
import 'package:getx_base_code/presentation/widgets/app_touchable.dart';

class AppDateTimePicker extends StatelessWidget {
  final Function(DateTime) onChange;
  final CupertinoDatePickerMode mode;
  final DateTime? initialDateTime;
  final DateTime? minimunDateTime;
  final DateTime? maximunDateTime;
  final bool use24h;
  final Function() onDone;

  const AppDateTimePicker(
      {Key? key,
      required this.onChange,
      required this.onDone,
      this.initialDateTime,
      this.minimunDateTime,
      this.maximunDateTime,
      this.use24h = true,
      this.mode = CupertinoDatePickerMode.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppDimens.space_16)
          .copyWith(top: AppDimens.space_8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppTouchable(
                onPressed: () => Get.back(),
                child: Padding(
                  padding: EdgeInsets.all(AppDimens.space_8),
                  child: Text(
                    'Hủy bỏ',
                    style: ThemeText.button.copyWith(color: AppColors.red),
                  ),
                ),
              ),
              AppTouchable(
                onPressed: onDone,
                child: Padding(
                  padding: EdgeInsets.all(AppDimens.space_8),
                  child: Text(
                    'Xác nhận',
                    style: ThemeText.button.copyWith(color: AppColors.primary),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: AppDimens.space_8,
          ),
          const Divider(
            height: 1,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: CupertinoDatePicker(
              mode: mode,
              minimumDate: minimunDateTime,
              maximumDate: maximunDateTime,
              use24hFormat: use24h,
              initialDateTime: initialDateTime ?? DateTime.now(),
              onDateTimeChanged: onChange,
            ),
          ),
        ],
      ),
    );
  }
}
