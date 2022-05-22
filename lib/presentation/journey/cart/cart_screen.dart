import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_base_code/common/common_export.dart';
import 'package:getx_base_code/presentation/journey/cart/cart_controller.dart';
import 'package:getx_base_code/presentation/theme/export.dart';
import 'package:getx_base_code/presentation/widgets/app_empty_widget.dart';
import 'package:getx_base_code/presentation/widgets/app_refresh_widget.dart';
import 'package:getx_base_code/presentation/widgets/app_scaffold.dart';
import 'package:getx_base_code/presentation/widgets/appbar_widget.dart';
import 'package:getx_base_code/presentation/widgets/export.dart';
import 'package:getx_base_code/presentation/widgets/list_shimmer/grid_shimmer_widget.dart';

class CartScreen extends GetView<CartController> {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBarWidget(
        title: Text(
          "Danh sách mượn",
          style: ThemeText.headline6
              .copyWith(fontSize: AppDimens.space_18, color: AppColors.white),
          textAlign: TextAlign.left,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppDimens.width_16),
        child: AppRefreshWidget(
          enableLoadMore: controller.hasLoadMore.value,
          onRefresh: controller.onRefresh,
          onLoadMore: controller.onLoadmore,
          controller: controller.refreshController,
          child: _buildBookList(context),
          footer: AppLoadingWidget(
            width: AppDimens.height_20,
          ),
        ),
      ),
    );
  }

  Widget _buildBookList(BuildContext context) {
    if (controller.rxLoadedType.value == LoadedType.start) {
      return const GridShimmerWidget();
    } else {
      if (controller.rxBooks.isEmpty) {
        return const Center(child: AppEmptyWidget());
      } else {
        final books = controller.rxBooks;
        final length = controller.rxBooks.length;
        return Column(
          children: [
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                padding: EdgeInsets.only(top: AppDimens.height_24),
                crossAxisSpacing: AppDimens.height_16,
                mainAxisSpacing: AppDimens.space_16,
                shrinkWrap: true,
                children: List.generate(length, (index) {
                  final book = books[index];
                  return BookWidget(
                    book: book,
                    onPressed: () {
                      Get.toNamed(AppRoutes.bookDetail,
                          arguments: {ArgumentConstants.book: book});
                    },
                  );
                }),
              ),
            ),
            AppButton(
              title: 'Đặt mượn',
              onPressed: () {},
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            )
          ],
        );
      }
    }
  }
}
