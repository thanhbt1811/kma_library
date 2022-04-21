import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_base_code/common/common_export.dart';
import 'package:getx_base_code/presentation/journey/home/widget/category_item.dart';
import 'package:getx_base_code/presentation/theme/export.dart';
import 'package:getx_base_code/presentation/widgets/app_scaffold.dart';
import 'package:getx_base_code/presentation/widgets/appbar_widget.dart';
import 'package:getx_base_code/presentation/widgets/export.dart';

import 'home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.context = context;
    return AppScaffold(
      appBar: const AppBarWidget(
        title: "Danh mục",
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppDimens.width_16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: AppDimens.height_24,
            ),
            AppTextFieldWidget(
              hintText: 'Tìm kiếm',
              backgroundColor: AppColors.gallerySolid,
              borderColor: AppColors.gallerySolid,
              prefixIcon: AppImageWidget(
                path: ImageConstants.icSearch,
                width: AppDimens.height_24,
              ),
            ),
            SizedBox(
              height: AppDimens.height_32,
            ),
            Text(
              'Danh mục',
              style: ThemeText.headline6.copyWith(fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: AppDimens.height_40,
            ),
            Expanded(
              child: Column(
                children: const [
                  CategoryItem(),
                  Spacer(),
                  CategoryItem(),
                  Spacer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
