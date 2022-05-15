import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_base_code/common/common_export.dart';
import 'package:getx_base_code/presentation/journey/book/book_detal/book_detail_controller.dart';
import 'package:getx_base_code/presentation/theme/export.dart';
import 'package:getx_base_code/presentation/widgets/app_button.dart';
import 'package:getx_base_code/presentation/widgets/app_image_widget.dart';
import 'package:getx_base_code/presentation/widgets/app_scaffold.dart';
import 'package:getx_base_code/presentation/widgets/appbar_widget.dart';

class BookDetailScreen extends GetView<BookDetailController> {
  const BookDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBarWidget(
        title: Text(
          'Nghệ thuật khắc kỷ',
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              Expanded(
                child: AppImageWidget(
                    path:
                        'https://book-management-storage.s3.us-east-1.amazonaws.com/thumbnails/28dbe6be-a9c8-49d0-fc92-08da31f325e8/272588839_703280581054845_949684622302582365_n.jpg'),
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
                        text: '1',
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
                  'Nghệ thuật khắc kỷ',
                  style: ThemeText.subtitle2.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(
                height: AppDimens.height_12,
              ),
              AppButton(
                title: 'Mượn sách',
                onPressed: _hireBook,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _hireBook() {}
}
