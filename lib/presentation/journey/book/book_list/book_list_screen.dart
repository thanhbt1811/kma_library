import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_base_code/common/constants/constants_export.dart';
import 'package:getx_base_code/presentation/journey/book/book_list/book_list_controller.dart';
import 'package:getx_base_code/presentation/theme/export.dart';
import 'package:getx_base_code/presentation/widgets/app_empty_widget.dart';
import 'package:getx_base_code/presentation/widgets/app_refresh_widget.dart';
import 'package:getx_base_code/presentation/widgets/app_scaffold.dart';
import 'package:getx_base_code/presentation/widgets/appbar_widget.dart';
import 'package:getx_base_code/presentation/widgets/export.dart';
import 'package:getx_base_code/presentation/widgets/list_shimmer/grid_shimmer_widget.dart';

class BookListScreen extends GetView<BookListController> {
  const BookListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.context = context;
    return AppScaffold(
      appBar: AppBarWidget(
        title: "Tài liệu môn học",
        leading: AppBarButton(
          iconSource: ImageConstants.icArrowLeft,
          onTap: () => Get.back(),
        ),
      ),
      backgroundColor: AppColors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppDimens.width_16),
        child: Column(children: [
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
            height: AppDimens.height_16,
          ),
          Expanded(
            child: Obx(
              () => AppRefreshWidget(
                enableLoadMore: controller.hasLoadMore.value,
                onRefresh: controller.onRefresh,
                onLoadMore: controller.onLoadmore,
                controller: controller.refreshController,
                child: _buildBookList(),
                footer: AppLoadingWidget(
                  width: AppDimens.height_20,
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  Widget _buildBookList() {
    if (controller.rxLoadedType.value == LoadedType.start) {
      return const GridShimmerWidget();
    } else {
      if (controller.rxBooks.isEmpty) {
        return const Center(child: AppEmptyWidget());
      } else {
        final books = controller.rxBooks;
        final length = controller.rxBooks.length;
        return GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: AppDimens.height_16,
          mainAxisSpacing: AppDimens.space_16,
          shrinkWrap: true,
          children: List.generate(length, (index) {
            final book = books[index];
            return BookWidget(
              book: book,
            );
          }),
        );
      }
    }
  }
}
