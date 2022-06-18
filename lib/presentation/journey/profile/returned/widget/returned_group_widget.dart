import 'package:flutter/material.dart';
import 'package:getx_base_code/common/common_export.dart';
import 'package:getx_base_code/common/constants/format_constants.dart';
import 'package:getx_base_code/domain/models/hire_model.dart';
import 'package:getx_base_code/presentation/journey/profile/returned/widget/returned_item.dart';
import 'package:getx_base_code/presentation/theme/export.dart';

class ReturnedGroupWidget extends StatelessWidget {
  final DateTime returnedDate;
  final List<HireModel> returnedList;
  const ReturnedGroupWidget({
    Key? key,
    required this.returnedDate,
    required this.returnedList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: AppColors.transparent),
      child: ExpansionTile(
        title: Text(
          'Ngày ${dateFormatter(FormatConstants.formatddMMyyyyy, returnedDate)}',
          style: ThemeText.subtitle1,
        ),
        children: List.generate(returnedList.length, (index) {
          return ReturnedItem(hire: returnedList[index]);
        }),
      ),
    );
  }
}
