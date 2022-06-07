import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_base_code/common/common_export.dart';
import 'package:getx_base_code/presentation/journey/auth/login/login_controller.dart';
import 'package:getx_base_code/presentation/theme/export.dart';
import 'package:getx_base_code/presentation/widgets/app_scaffold.dart';
import 'package:getx_base_code/presentation/widgets/export.dart';
import 'package:getx_base_code/presentation/widgets/keybroad_avoid.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.context = context;
    return AppScaffold(
        backgroundColor: AppColors.white,
        body: KeyBroadAvoid(
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppDimens.space_16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(
                  children: [
                    SafeArea(
                        child: Align(
                            alignment: Alignment.center,
                            child:
                                AppImageWidget(path: ImageConstants.kmaLogo))),
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
                          height: AppDimens.height_24,
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  'Thư viện KMA',
                  style: ThemeText.headline3.copyWith(
                      color: AppColors.black, fontWeight: FontWeight.w700),
                ),
                Column(
                  children: [
                    AppTextFieldWidget(
                      hintText: 'Mã sinh viên',
                      controller: controller.studentId,
                      shadowColor: AppColors.black.withOpacity(0.12),
                      elevation: 6.0,
                      onChanged: (_) => controller.setRxActiveBtn(),
                      prefixIcon: AppImageWidget(
                        path: ImageConstants.icUser,
                        width: AppDimens.height_24,
                      ),
                    ),
                    SizedBox(
                      height: AppDimens.height_16,
                    ),
                    AppObscureFieldWidget(
                      hintText: 'Mật khẩu',
                      controller: controller.passwordCtl,
                      shadowColor: AppColors.black.withOpacity(0.12),
                      elevation: 6.0,
                      onChanged: (_) => controller.setRxActiveBtn(),
                      prefixIcon: AppImageWidget(
                        path: ImageConstants.icLock,
                        width: AppDimens.height_24,
                      ),
                    ),
                    SizedBox(
                      height: AppDimens.height_16,
                    ),
                  ],
                ),
                Obx(
                  () => AppButton(
                    title: 'ĐĂNG NHẬP',
                    loaded: controller.rxLoadedType.value,
                    onPressed: controller.rxActiveBtn.value
                        ? () => controller.login()
                        : null,
                  ),
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
