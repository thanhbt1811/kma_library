import 'package:flutter/material.dart';
import 'package:getx_base_code/common/common_export.dart';
import 'package:getx_base_code/common/extensions/calender_extensions.dart';
import 'package:getx_base_code/presentation/theme/export.dart';

class SelectCalenderWidget extends StatelessWidget {
  final Function(Calender) onTap;
  final Calender current;
  const SelectCalenderWidget(
      {Key? key, required this.onTap, required this.current})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.separated(
          padding: EdgeInsets.symmetric(
              vertical: AppDimens.height_12, horizontal: AppDimens.width_16),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final calender = Calender.values[index];
            return InkWell(
              onTap: () => onTap(calender),
              child: Container(
                height: AppDimens.height_44,
                alignment: Alignment.center,
                child: Text(
                  calender.label,
                  style: ThemeText.subtitle2.copyWith(
                      color: current == calender
                          ? AppColors.blue
                          : AppColors.text),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            if (index == Calender.values.length - 1) {
              return const SizedBox.shrink();
            } else {
              return const Divider(
                height: 1,
              );
            }
          },
          itemCount: Calender.values.length),
    );
  }
}
