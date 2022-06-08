import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_base_code/common/common_export.dart';
import 'package:getx_base_code/presentation/journey/home/category/category_controller.dart';
import 'package:getx_base_code/presentation/journey/home/category/widget/category_item.dart';
import 'package:getx_base_code/presentation/theme/export.dart';
import 'package:getx_base_code/presentation/widgets/app_empty_widget.dart';
import 'package:getx_base_code/presentation/widgets/app_refresh_widget.dart';
import 'package:getx_base_code/presentation/widgets/app_scaffold.dart';
import 'package:getx_base_code/presentation/widgets/appbar_widget.dart';
import 'package:getx_base_code/presentation/widgets/export.dart';
import 'package:getx_base_code/presentation/widgets/list_shimmer/list_shimmer_widget.dart';

class CategoryScreen extends GetView<CategoryController> {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.context = context;
    return AppScaffold(
      appBar: AppBarWidget(
        title: Text(
          'Danh mục',
          style: ThemeText.headline6
              .copyWith(fontSize: AppDimens.space_18, color: AppColors.white),
          textAlign: TextAlign.left,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppDimens.width_16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SizedBox(
            //   height: AppDimens.height_24,
            // ),
            // AppTextFieldWidget(
            //   hintText: 'Tìm kiếm',
            //   backgroundColor: AppColors.gallerySolid,
            //   borderColor: AppColors.gallerySolid,
            //   prefixIcon: AppImageWidget(
            //     path: ImageConstants.icSearch,
            //     width: AppDimens.height_24,
            //   ),
            // ),
            // SizedBox(
            //   height: AppDimens.height_32,
            // ),
            // Text(
            //   'Danh mục',
            //   style: ThemeText.headline6.copyWith(fontWeight: FontWeight.w700),
            // ),
            // SizedBox(
            //   height: AppDimens.height_20,
            // ),
            Expanded(
              child: Obx(() {
                return AppRefreshWidget(
                  enableLoadMore: controller.hasLoadMore.value,
                  onRefresh: () => controller.onRefresh(context),
                  onLoadMore: controller.onLoadmore,
                  controller: controller.refreshController,
                  footer: AppLoadingWidget(
                    width: AppDimens.height_20,
                  ),
                  child: _buildCategoryList(),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryList() {
    if (controller.rxLoadedType.value == LoadedType.start) {
      return const ListShimmerWidget();
    } else {
      if (controller.categories.isEmpty) {
        return const Center(child: AppEmptyWidget());
      } else {
        // return ListView.separated(
        //     padding: EdgeInsets.only(bottom: AppDimens.height_20),
        //     itemBuilder: (context, index) {
        //       final category = controller.categories[index];
        //       return CategoryItem(
        //         category: category,
        //         onTap: () {
        //           Get.toNamed(AppRoutes.bookList, arguments: {
        //             ArgumentConstants.categoryId: category.id,
        //             ArgumentConstants.categoryName: category.categoryName
        //           });
        //         },
        //       );
        //     },
        //     separatorBuilder: (context, index) {
        //       return Spacer();
        //     },
        //     itemCount: controller.categories.length);
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(controller.categories.length, (index) {
            final category = controller.categories[index];
            return CategoryItem(
              category: category,
              onTap: () {
                Get.toNamed(
                  AppRoutes.bookList,
                  arguments: {
                    ArgumentConstants.categoryId: category.id,
                    ArgumentConstants.categoryName: category.categoryName
                  },
                );
              },
            );
          }),
        );
      }
    }
  }
}
