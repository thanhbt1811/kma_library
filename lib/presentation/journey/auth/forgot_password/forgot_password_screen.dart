import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_base_code/common/common_export.dart';
import 'package:getx_base_code/presentation/journey/auth/forgot_password/forgot_password_controller.dart';
import 'package:getx_base_code/presentation/theme/export.dart';
import 'package:getx_base_code/presentation/widgets/app_scaffold.dart';
import 'package:getx_base_code/presentation/widgets/export.dart';
import 'package:getx_base_code/presentation/widgets/keybroad_avoid.dart';

class ForgotPasswordScreen extends GetView<ForgotPasswordController> {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        backgroundColor: AppColors.white,
        body: KeyBroadAvoid(
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppDimens.space_16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SafeArea(child: AppImageWidget(path: ImageConstants.kmaLogo)),
                Column(
                  children: [
                    Text(
                      'XIN CHÀO',
                      style: ThemeText.headline4.copyWith(
                          color: AppColors.black, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: AppDimens.height_40,
                    ),
                    Text(
                      'Đăng nhập email của bạn',
                      style: ThemeText.bodyText2,
                    ),
                  ],
                ),
                AppTextFieldWidget(
                  hintText: 'Nhập email của bạn ',
                  controller: controller.emailCtl,
                  shadowColor: AppColors.black.withOpacity(0.12),
                  elevation: 6.0,
                  prefixIcon: AppImageWidget(
                    path: ImageConstants.icMail,
                    width: AppDimens.height_24,
                  ),
                ),
                Column(
                  children: [
                    AppButton(
                      title: 'Gửi',
                      onPressed: () {},
                    ),
                    SizedBox(
                      height: AppDimens.height_16,
                    ),
                    AppTouchable(
                      onPressed: () => Get.back(),
                      child: Text(
                        'Đăng nhập',
                        style: ThemeText.bodyText2,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                )
              ],
            ),
          ),
        ));
  }
}
