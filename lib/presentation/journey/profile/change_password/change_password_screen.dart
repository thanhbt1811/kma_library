import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_base_code/common/common_export.dart';
import 'package:getx_base_code/presentation/journey/profile/change_password/change_password_controller.dart';
import 'package:getx_base_code/presentation/theme/export.dart';
import 'package:getx_base_code/presentation/widgets/app_scaffold.dart';
import 'package:getx_base_code/presentation/widgets/appbar_widget.dart';
import 'package:getx_base_code/presentation/widgets/export.dart';
import 'package:getx_base_code/presentation/widgets/keybroad_avoid.dart';

class ChangePasswordScreen extends GetView<ChangePasswordController> {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBarWidget(
        title: Text(
          'Đổi mật khẩu',
          style: ThemeText.headline6
              .copyWith(fontSize: AppDimens.space_18, color: AppColors.white),
          textAlign: TextAlign.left,
        ),
        leading: AppBarButton(
          iconSource: ImageConstants.icArrowLeft,
          onTap: () => Get.back(),
        ),
      ),
      body: KeyBroadAvoid(
        body: Container(
          color: AppColors.white,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppDimens.space_16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: AppDimens.height_36,
                    ),
                    AppObscureFieldWidget(
                      controller: controller.oldPasswordCtl,
                      hintText: 'Mật khẩu cũ',
                      shadowColor: AppColors.black.withOpacity(0.12),
                      elevation: 6.0,
                      prefixIcon: AppImageWidget(
                        path: ImageConstants.icLock,
                        width: AppDimens.height_24,
                      ),
                    ),
                    SizedBox(
                      height: AppDimens.height_16,
                    ),
                    AppObscureFieldWidget(
                      controller: controller.newPasswordCtl,
                      hintText: 'Tạo mật khẩu mới',
                      shadowColor: AppColors.black.withOpacity(0.12),
                      elevation: 6.0,
                      prefixIcon: AppImageWidget(
                        path: ImageConstants.icLock,
                        width: AppDimens.height_24,
                      ),
                    ),
                    SizedBox(
                      height: AppDimens.height_16,
                    ),
                    AppObscureFieldWidget(
                      controller: controller.reNewPasswordCtl,
                      hintText: 'Nhập lại mật khẩu mới',
                      shadowColor: AppColors.black.withOpacity(0.12),
                      elevation: 6.0,
                      prefixIcon: AppImageWidget(
                        path: ImageConstants.icLock,
                        width: AppDimens.height_24,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    AppButton(
                      title: 'ĐỔI MẬT KHẨU ',
                      onPressed: () {},
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
