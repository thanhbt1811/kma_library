import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_base_code/common/common_export.dart';
import 'package:getx_base_code/domain/usecases/book_usecase.dart';
import 'package:getx_base_code/presentation/journey/book/book_detail/book_detail_controller.dart';
import 'package:getx_base_code/presentation/theme/export.dart';
import 'package:getx_base_code/presentation/widgets/app_scaffold.dart';
import 'package:getx_base_code/presentation/widgets/appbar_widget.dart';
import 'package:getx_base_code/presentation/widgets/export.dart';
import 'package:shimmer/shimmer.dart';

class BookDetailScreen extends GetView<BookDetailController> {
  const BookDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.context = context;
    return AppScaffold(
      appBar: AppBarWidget(
        title: Text(
          controller.book.value.title,
          style: ThemeText.headline6
              .copyWith(fontSize: AppDimens.space_18, color: AppColors.white),
          textAlign: TextAlign.left,
        ),
        leading: AppBarButton(
          iconSource: ImageConstants.icArrowLeft,
          onTap: () => Get.back(id: BottomNavigationType.home.index),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppDimens.width_16),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  SizedBox(
                    height: AppDimens.height_16,
                  ),
                  AppTouchable(
                    onPressed: controller.book.value.categoryCode ==
                            'Sách tham khảo'
                        ? () {
                            Get.toNamed(AppRoutes.overViewBook,
                                arguments: {
                                  ArgumentConstants.book: controller.book.value
                                },
                                id: BottomNavigationType.home.index);
                          }
                        : null,
                    child: AppImageWidget(
                      path: controller.book.value.thumbnail,
                      height: MediaQuery.of(context).size.height * 0.3,
                    ),
                  ),
                  SizedBox(
                    height: AppDimens.height_12,
                  ),
                  RichText(
                    text: TextSpan(
                        text: 'Số lượng: ',
                        style: ThemeText.subtitle1,
                        children: [
                          TextSpan(
                            text: controller.book.value.quantity.toString(),
                            style: ThemeText.subtitle2.copyWith(
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ]),
                  ),
                  SizedBox(
                    height: AppDimens.height_12,
                  ),
                  Text(
                    'Mô tả',
                    style: ThemeText.subtitle1,
                  ),
                  SizedBox(
                    height: AppDimens.height_12,
                  ),
                  Text(
                    controller.book.value.description ?? '',
                    style: ThemeText.subtitle2.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: AppDimens.height_12,
                  ),
                  Text(
                    'Gợi ý',
                    style: ThemeText.subtitle1,
                  ),
                  Obx(
                    () {
                      if (controller.bookListLoading.value ==
                          LoadedType.start) {
                        return SizedBox(
                          height: AppDimens.height_160,
                          width: AppDimens.width_80,
                          child: Shimmer.fromColors(
                            baseColor: AppColors.grey200!,
                            highlightColor: AppColors.grey100!,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                padding:
                                    EdgeInsets.only(left: AppDimens.width_16),
                                itemCount: 5,
                                itemBuilder: ((context, index) {
                                  return Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: AppDimens.width_8),
                                    child: Column(
                                      children: [
                                        AppShimmer(
                                          height: AppDimens.height_120,
                                          width: AppDimens.width_80,
                                        ),
                                        SizedBox(
                                          height: AppDimens.height_8,
                                        ),
                                        AppShimmer(
                                          width: AppDimens.width_80,
                                          height: AppDimens.height_12,
                                        )
                                      ],
                                    ),
                                  );
                                })),
                          ),
                        );
                      } else if (controller.books.isEmpty) {
                        return const SizedBox();
                      } else {
                        final books = controller.books;
                        return SizedBox(
                          height: AppDimens.height_200,
                          child: ListView.builder(
                              controller: controller.scrollController,
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              padding: EdgeInsets.symmetric(
                                  horizontal: AppDimens.width_16,
                                  vertical: AppDimens.height_16),
                              itemBuilder: (context, index) {
                                final book = books[index];
                                return AppTouchable(
                                  onPressed: () {
                                    final newController = BookDetailController(
                                      getIt<BookUsecase>(),
                                      book.obs,
                                    );
                                    Get.lazyReplace(() => newController);
                                    Get.to(const BookDetailScreen(),
                                        preventDuplicates: false,
                                        id: BottomNavigationType.home.index);
                                  },
                                  padding: EdgeInsets.symmetric(
                                      horizontal: AppDimens.width_12),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: AppDimens.height_120,
                                        width: AppDimens.height_112,
                                        child: AppImageWidget(
                                          path: book.thumbnail,
                                          isBorder: true,
                                        ),
                                      ),
                                      Text(
                                        book.title,
                                        style: ThemeText.subtitle2.copyWith(
                                            color: AppColors.appbarColor),
                                      )
                                    ],
                                  ),
                                );
                              },
                              itemCount: books.length),
                        );
                      }
                    },
                  ),
                  SizedBox(
                    height: AppDimens.height_12,
                  ),
                ],
              ),
            ),
            controller.book.value.categoryCode != 'Sách tham khảo'
                ? Obx(
                    () => AppButton(
                      title: 'Mượn sách',
                      loaded: controller.rxLoadedType.value,
                      onPressed: controller.activeButton.value
                          ? controller.addToCart
                          : null,
                    ),
                  )
                : const SizedBox.shrink(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            )
          ],
        ),
      ),
    );
  }
}
