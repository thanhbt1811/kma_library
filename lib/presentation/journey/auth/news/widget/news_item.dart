import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_base_code/common/common_export.dart';
import 'package:getx_base_code/domain/models/new_model.dart';
import 'package:getx_base_code/presentation/theme/export.dart';
import 'package:getx_base_code/presentation/widgets/app_image_widget.dart';

class NewsItem extends StatelessWidget {
  final NewModel noti;
  const NewsItem({Key? key, required this.noti}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes.newsDetail, arguments: {
          ArgumentConstants.newModel: noti,
        });
      },
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.disableColor,
          borderRadius: BorderRadius.all(
            Radius.circular(AppDimens.radius_15),
          ),
        ),
        padding: EdgeInsets.all(AppDimens.height_12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              noti.title,
              style: ThemeText.subtitle1.copyWith(fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: AppDimens.height_12,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    noti.content,
                    maxLines: 3,
                    overflow: TextOverflow.visible,
                    style: ThemeText.subtitle2
                        .copyWith(fontWeight: FontWeight.w400),
                  ),
                ),
                AppImageWidget(
                  path: ImageConstants.icArrowRight,
                  width: AppDimens.width_16,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
