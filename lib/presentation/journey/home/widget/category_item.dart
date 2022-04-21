import 'package:flutter/material.dart';
import 'package:getx_base_code/common/common_export.dart';
import 'package:getx_base_code/presentation/theme/export.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.second,
        borderRadius: BorderRadius.all(
          Radius.circular(AppDimens.radius_15),
        ),
      ),
      padding: EdgeInsets.all(AppDimens.space_12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Tài Liệu',
            style: ThemeText.subtitle1.copyWith(color: AppColors.white),
          ),
          SizedBox(
            height: AppDimens.height_80,
          ),
          Text(
            '20+',
            style: ThemeText.subtitle2.copyWith(color: AppColors.white),
          ),
          Text(
            'Sách',
            style: ThemeText.subtitle2.copyWith(color: AppColors.white),
          ),
        ],
      ),
    );
  }
}
