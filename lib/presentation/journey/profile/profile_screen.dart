import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_base_code/common/common_export.dart';
import 'package:getx_base_code/presentation/journey/profile/profile_controller.dart';
import 'package:getx_base_code/presentation/journey/profile/widget/account_widget.dart';
import 'package:getx_base_code/presentation/journey/profile/widget/menu_item_widget.dart';
import 'package:getx_base_code/presentation/theme/export.dart';
import 'package:getx_base_code/presentation/widgets/app_scaffold.dart';
import 'package:getx_base_code/presentation/widgets/appbar_widget.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: const AppBarWidget(
        title: 'Tài khoản',
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: AppDimens.height_120,
                color: AppColors.gallerySolid,
              ),
              Expanded(
                child: Container(
                  color: AppColors.white,
                  padding: EdgeInsets.only(top: AppDimens.height_44),
                  child: Column(
                    children: [
                      MenuItemWidget(title: 'Trang cá nhân', onTap: () {}),
                      const Divider(
                        height: 1,
                      ),
                      MenuItemWidget(
                          title: 'Lịch sử mượn',
                          onTap: () => Get.toNamed(AppRoutes.history)),
                      const Divider(
                        height: 1,
                      ),
                      MenuItemWidget(
                          title: 'Lịch sử đặt mượn',
                          onTap: () => Get.toNamed(AppRoutes.historyOrder)),
                      const Divider(
                        height: 1,
                      ),
                      MenuItemWidget(
                        title: 'Thông báo',
                        onTap: () {},
                        action: Obx(
                          (() => Switch(
                                onChanged: (_) => controller.setRxActiveNoti(),
                                value: controller.rxActiveNoti.value,
                                activeColor: AppColors.second,
                                activeTrackColor:
                                    AppColors.second.withOpacity(0.5),
                                inactiveThumbColor: AppColors.second,
                                inactiveTrackColor:
                                    AppColors.second.withOpacity(0.5),
                              )),
                        ),
                      ),
                      const Divider(
                        height: 1,
                      ),
                      MenuItemWidget(
                        title: 'Đổi mật khẩu',
                        onTap: () => Get.toNamed(AppRoutes.changePassword),
                      ),
                      const Divider(
                        height: 1,
                      ),
                      MenuItemWidget(
                          title: 'Đăng xuất',
                          textStyle: ThemeText.subtitle1.copyWith(
                              fontWeight: FontWeight.w400,
                              color: AppColors.radicalRedApprox),
                          onTap: () {}),
                    ],
                  ),
                ),
              )
            ],
          ),
          const AccountWidget()
        ],
      ),
    );
  }
}