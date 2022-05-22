import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_base_code/common/common_export.dart';
import 'package:getx_base_code/presentation/journey/book/book_detal/book_detail_controller.dart';
import 'package:getx_base_code/presentation/theme/export.dart';
import 'package:getx_base_code/presentation/widgets/app_button.dart';
import 'package:getx_base_code/presentation/widgets/app_image_widget.dart';
import 'package:getx_base_code/presentation/widgets/app_scaffold.dart';
import 'package:getx_base_code/presentation/widgets/app_touchable.dart';
import 'package:getx_base_code/presentation/widgets/appbar_widget.dart';
import 'package:getx_base_code/presentation/widgets/keybroad_avoid.dart';

class BookDetailScreen extends GetView<BookDetailController> {
  const BookDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.context = context;
    return AppScaffold(
      appBar: AppBarWidget(
        title: Text(
          controller.book.title,
          style: ThemeText.headline6
              .copyWith(fontSize: AppDimens.space_18, color: AppColors.white),
          textAlign: TextAlign.left,
        ),
        leading: AppBarButton(
          iconSource: ImageConstants.icArrowLeft,
          onTap: () => Get.back(),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppDimens.width_16),
        child: KeyBroadAvoid(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: AppDimens.height_16,
              ),
              AppTouchable(
                  onPressed: () {
                    Get.toNamed(AppRoutes.overViewBook,
                        arguments: {ArgumentConstants.book: controller.book});
                  },
                  child: AppImageWidget(path: controller.book.thumbnail)),
              SizedBox(
                height: AppDimens.height_12,
              ),
              RichText(
                text: TextSpan(
                    text: 'Số lượng: ',
                    style: ThemeText.subtitle1,
                    children: [
                      TextSpan(
                        text: controller.book.quantity.toString(),
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
              Expanded(
                child: Text(
                  controller.book.description ?? '',
                  style: ThemeText.subtitle2.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(
                height: AppDimens.height_12,
              ),
              Obx(
                () => AppButton(
                  title: 'Mượn sách',
                  loaded: controller.rxLoadedType.value,
                  onPressed: _hireBook,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              )
            ],
          ),
        ),
      ),
    );
  }

  void _hireBook() {
    controller.addToCart();
  }
}
