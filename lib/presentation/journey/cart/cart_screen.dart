import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_base_code/common/common_export.dart';
import 'package:getx_base_code/presentation/journey/cart/cart_controller.dart';
import 'package:getx_base_code/presentation/theme/export.dart';
import 'package:getx_base_code/presentation/widgets/app_scaffold.dart';
import 'package:getx_base_code/presentation/widgets/appbar_widget.dart';
import 'package:getx_base_code/presentation/widgets/export.dart';

class CartScreen extends GetView<CartController> {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: const AppBarWidget(
        title: 'Giỏ mượn sách',
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
                    mainAxisSpacing: AppDimens.space_4,
                    shrinkWrap: true,
                    children: List.generate(30, (index) => Container()),
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
            ),
          ],
        ),
      ),
    );
  }
}
