import 'package:flutter/material.dart';
import 'package:getx_base_code/common/common_export.dart';
import 'package:getx_base_code/domain/models/book_model.dart';
import 'package:getx_base_code/presentation/theme/export.dart';
import 'package:getx_base_code/presentation/widgets/app_image_widget.dart';

class BookWidget extends StatelessWidget {
  final bool showStar;
  final bool showRecycleBin;
  final BookModel book;
  const BookWidget(
      {Key? key,
      required this.book,
      this.showRecycleBin = false,
      this.showStar = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            AppImageWidget(
              height: AppDimens.height_120,
              path: book.thumbnail,
              isBorder: true,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppDimens.height_12)
                  .copyWith(bottom: AppDimens.height_12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Visibility(
                    visible: showStar,
                    child: AppImageWidget(
                      path: ImageConstants.icStar,
                      color: AppColors.second,
                    ),
                  ),
                  Visibility(
                    visible: showRecycleBin,
                    child: AppImageWidget(
                      path: ImageConstants.icRecycleBin,
                      color: AppColors.red,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: AppDimens.height_8,
        ),
        Expanded(
          child: Text(
            book.title,
            style: ThemeText.subtitle2.copyWith(color: AppColors.appbarColor),
          ),
        )
      ],
    );
  }
}
