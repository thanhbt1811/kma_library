import 'package:flutter/material.dart';
import 'package:getx_base_code/common/common_export.dart';
import 'package:getx_base_code/domain/models/cateogory_model.dart';
import 'package:getx_base_code/presentation/theme/export.dart';
import 'package:getx_base_code/presentation/widgets/app_touchable.dart';

class CategoryItem extends StatelessWidget {
  final CategoryModel category;
  final Function() onTap;
  final Color background;
  const CategoryItem(
      {Key? key,
      required this.category,
      required this.onTap,
      required this.background})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppTouchable(
      onPressed: onTap,
      child: Container(
        height: 160.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: background,
          borderRadius: const BorderRadius.all(
            Radius.circular(AppDimens.radius_15),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(AppDimens.space_16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                category.categoryName,
                style: ThemeText.headline6.copyWith(color: AppColors.white),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _geStringtTotal(category.totalBook),
                    style: ThemeText.subtitle2.copyWith(
                      color: AppColors.white,
                      fontSize: 18.sp,
                    ),
                  ),
                  Text(
                    'Sách',
                    style: ThemeText.subtitle2.copyWith(
                      color: AppColors.white,
                      fontSize: 18.sp,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _geStringtTotal(int total) {
    if (total <= 20) {
      return '$total';
    } else {
      return '20+';
    }
  }
}
