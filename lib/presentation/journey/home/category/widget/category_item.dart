import 'package:flutter/material.dart';
import 'package:getx_base_code/common/common_export.dart';
import 'package:getx_base_code/domain/models/cateogory_model.dart';
import 'package:getx_base_code/presentation/theme/export.dart';
import 'package:getx_base_code/presentation/widgets/app_image_widget.dart';
import 'package:getx_base_code/presentation/widgets/app_touchable.dart';

class CategoryItem extends StatelessWidget {
  final CategoryModel category;
  final Function() onTap;
  const CategoryItem({Key? key, required this.category, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppTouchable(
      onPressed: onTap,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(AppDimens.radius_15),
          ),
        ),
        padding: EdgeInsets.all(AppDimens.space_12),
        child: Container(
          height: 155.h,
          width: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(ImageConstants.icDefaultCategory)),
              borderRadius:
                  BorderRadius.all(Radius.circular(AppDimens.radius_15))),
          child: Padding(
            padding: EdgeInsets.all(AppDimens.space_12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  category.categoryName,
                  style: ThemeText.subtitle1.copyWith(color: AppColors.white),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _geStringtTotal(category.totalBook),
                      style:
                          ThemeText.subtitle2.copyWith(color: AppColors.white),
                    ),
                    Text(
                      'Sách',
                      style:
                          ThemeText.subtitle2.copyWith(color: AppColors.white),
                    ),
                  ],
                ),
              ],
            ),
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
