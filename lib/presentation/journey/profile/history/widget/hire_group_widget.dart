import 'package:flutter/material.dart';
import 'package:getx_base_code/common/common_export.dart';
import 'package:getx_base_code/common/constants/format_constants.dart';
import 'package:getx_base_code/domain/models/hire_model.dart';
import 'package:getx_base_code/presentation/journey/profile/history/widget/history_item.dart';
import 'package:getx_base_code/presentation/theme/export.dart';

class HireGroupWidget extends StatelessWidget {
  final DateTime hireDate;
  final List<HireModel> hireList;
  final int currentLength;
  final String errorMessage;
  final Function(bool, HireModel) onLongPressed;

  const HireGroupWidget(
      {Key? key,
      required this.hireDate,
      required this.hireList,
      required this.currentLength,
      required this.errorMessage,
      required this.onLongPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: AppColors.transparent),
      child: ExpansionTile(
        title: Text(
          'Ngày ${dateFormatter(FormatConstants.formatddMMyyyyy, hireDate)}',
          style: ThemeText.subtitle1,
        ),
        children: List.generate(hireList.length, (index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: AppDimens.height_4),
            child: HistoryItem(
              hire: hireList[index],
              onLongPress: (value) => onLongPressed(value, hireList[index]),
              errorMessage: errorMessage,
              currentLenght: currentLength,
            ),
          );
        }),
      ),
    );
  }
}
