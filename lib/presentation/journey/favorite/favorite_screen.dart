import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_base_code/common/common_export.dart';
import 'package:getx_base_code/presentation/journey/favorite/favorite_controller.dart';
import 'package:getx_base_code/presentation/theme/export.dart';
import 'package:getx_base_code/presentation/widgets/app_scaffold.dart';
import 'package:getx_base_code/presentation/widgets/appbar_widget.dart';
import 'package:getx_base_code/presentation/widgets/export.dart';

class FavoriteScreen extends GetView<FavoriteController> {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBarWidget(
        title: Text(
          'Yêu thích',
          style: ThemeText.headline6
              .copyWith(fontSize: AppDimens.space_18, color: AppColors.white),
          textAlign: TextAlign.left,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppDimens.width_16),
        child: Stack(
          children: [
            Column(
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
                  height: AppDimens.height_16,
                ),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: AppDimens.height_16,
                    mainAxisSpacing: AppDimens.space_16,
                    shrinkWrap: true,
                    children: List.generate(
                      30,
                      (index) => Container(),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
