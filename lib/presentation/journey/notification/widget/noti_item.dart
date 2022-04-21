import 'package:flutter/material.dart';
import 'package:getx_base_code/common/common_export.dart';
import 'package:getx_base_code/presentation/theme/export.dart';

class NotiItem extends StatelessWidget {
  const NotiItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.disableColor,
        borderRadius: BorderRadius.all(
          Radius.circular(AppDimens.radius_15),
        ),
      ),
      padding: EdgeInsets.all(AppDimens.height_12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Ngày 09/04/2022',
            style: ThemeText.subtitle2.copyWith(fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: AppDimens.height_12,
          ),
          Text(
            'sắp đến hạn trả  sách cấu trúc dữ liệu và giải thuật ',
            style: ThemeText.subtitle2.copyWith(fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}
