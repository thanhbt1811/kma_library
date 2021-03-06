import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_base_code/common/common_export.dart';
import 'package:getx_base_code/presentation/theme/export.dart';
import 'package:getx_base_code/presentation/widgets/export.dart';

import 'splash_controller.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.context = context;
    return Material(
      color: AppColors.white,
      child: Stack(
        children: [
          Center(
            child: AppImageWidget(
              path: ImageConstants.kmaLogo,
            ),
          ),
          Container(
            color: AppColors.black.withOpacity(0.5),
          ),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'THƯ VIỆN',
                  style: ThemeText.headline4.copyWith(
                      color: AppColors.white, fontWeight: FontWeight.w700),
                ),
                Text(
                  'KMA',
                  style: ThemeText.headline4.copyWith(
                      color: AppColors.white, fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppDimens.space_16)
                  .copyWith(bottom: AppDimens.height_112),
              child: Obx(
                () => AppButton(
                  title: 'ĐĂNG NHẬP',
                  loaded: controller.rxLoadedType.value,
                  onPressed: () => controller.initLogin(),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
                right: AppDimens.width_16, top: AppDimens.height_24),
            alignment: Alignment.topRight,
            child: AppTouchable(
              onPressed: () {
                Get.toNamed(AppRoutes.news);
              },
              outlinedBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
              padding: EdgeInsets.only(top: AppDimens.height_16),
              width: AppDimens.width_40,
              height: AppDimens.width_40,
              child: AppImageWidget(
                path: ImageConstants.icBell,
                color: AppColors.white,
                height: AppDimens.height_24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
