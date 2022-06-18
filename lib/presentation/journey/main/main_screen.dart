import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_base_code/common/common_export.dart';
import 'package:getx_base_code/presentation/journey/account/account_screen.dart';
import 'package:getx_base_code/presentation/journey/cart/cart_screen.dart';
import 'package:getx_base_code/presentation/journey/home/home_screen.dart';
import 'package:getx_base_code/presentation/journey/notification/notification_screen.dart';
import 'package:getx_base_code/presentation/theme/export.dart';
import 'package:getx_base_code/presentation/widgets/export.dart';

import 'main_controller.dart';

class MainScreen extends GetView<MainController> {
  const MainScreen({Key? key}) : super(key: key);

  Widget _buildBottomNavigationItemWidget(
    BuildContext context, {
    Function()? onPressed,
    String? path,
    bool isSelected = false,
  }) {
    return Expanded(
      child: AppTouchable(
        onPressed: onPressed,
        outlinedBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        padding: EdgeInsets.only(
          top: AppDimens.space_12,
          bottom: MediaQuery.of(context).padding.bottom + 12.sp,
        ),
        child: AppImageWidget(
          path: path!,
          height: AppDimens.space_20,
          color: isSelected ? AppColors.second : AppColors.disableColor,
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.gallerySolid,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(AppDimens.radius_16),
            topRight: Radius.circular(AppDimens.radius_16),
          ),
          border: Border.all(color: AppColors.galleryApprox, width: 3)),
      padding: EdgeInsets.symmetric(horizontal: AppDimens.width_16).copyWith(
        top: AppDimens.height_16,
        bottom: AppDimens.height_24,
      ),
      child: Obx(
        () => Row(
          children: [
            _buildBottomNavigationItemWidget(
              context,
              path: ImageConstants.icHome,
              isSelected: controller.rxCurrentNavIndex.value == 0,
              onPressed: () => controller.onChangedNav(0),
            ),
            _buildBottomNavigationItemWidget(
              context,
              path: ImageConstants.icBell,
              isSelected: controller.rxCurrentNavIndex.value == 1,
              onPressed: () => controller.onChangedNav(1),
            ),
            _buildBottomNavigationItemWidget(
              context,
              path: ImageConstants.icCart,
              isSelected: controller.rxCurrentNavIndex.value == 2,
              onPressed: () => controller.onChangedNav(2),
            ),
            _buildBottomNavigationItemWidget(
              context,
              path: ImageConstants.icNavAccount,
              isSelected: controller.rxCurrentNavIndex.value == 3,
              onPressed: () => controller.onChangedNav(3),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    controller.context = context;
    final List<Widget> pages = [
      const HomeScreen(),
      const NotificationScreen(),
      const CartScreen(),
      const AccountScreen()
    ];

    return WillPopScope(
      onWillPop: () async {
        Get.back(id: controller.rxCurrentNavIndex.value);
        return false;
      },
      child: Scaffold(
        backgroundColor: AppColors.grey100,
        body: Obx(() => pages[controller.rxCurrentNavIndex.value]),
        bottomNavigationBar: _buildBottomNavigationBar(context),
      ),
    );
  }
}
