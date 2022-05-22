import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_base_code/common/common_export.dart';
import 'package:getx_base_code/presentation/journey/profile/my_profile/my_profile_controller.dart';
import 'package:getx_base_code/presentation/journey/profile/widget/avatar_widget.dart';
import 'package:getx_base_code/presentation/theme/export.dart';
import 'package:getx_base_code/presentation/widgets/app_scaffold.dart';
import 'package:getx_base_code/presentation/widgets/appbar_widget.dart';
import 'package:getx_base_code/presentation/widgets/export.dart';

class MyProfileScreen extends GetView<MyProfileController> {
  const MyProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBarWidget(
        title: Text(
          'Trang cá nhân',
          style: ThemeText.headline6
              .copyWith(fontSize: AppDimens.space_18, color: AppColors.white),
          textAlign: TextAlign.left,
        ),
        leading: AppBarButton(
          iconSource: ImageConstants.icArrowLeft,
          onTap: () => Get.back(),
        ),
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
                  padding: EdgeInsets.only(top: AppDimens.height_44).copyWith(
                      right: AppDimens.width_16, left: AppDimens.width_16),
                  child: Column(
                    children: [
                      AppTextFieldWidget(
                        hintText: controller.user.name,
                        shadowColor: AppColors.black.withOpacity(0.12),
                        readOnly: true,
                        elevation: 6.0,
                        prefixIcon: AppImageWidget(
                          height: AppDimens.height_20,
                          path: ImageConstants.icUser,
                          width: AppDimens.height_20,
                        ),
                      ),
                      SizedBox(
                        height: AppDimens.height_16,
                      ),
                      AppTextFieldWidget(
                        hintText: controller.user.studentIdenitify,
                        shadowColor: AppColors.black.withOpacity(0.12),
                        readOnly: true,
                        elevation: 6.0,
                        prefixIcon: AppImageWidget(
                          height: AppDimens.height_16,
                          path: ImageConstants.icPersionCard,
                          width: AppDimens.height_16,
                        ),
                      ),
                      SizedBox(
                        height: AppDimens.height_16,
                      ),
                      AppTextFieldWidget(
                        hintText: controller.user.email,
                        shadowColor: AppColors.black.withOpacity(0.12),
                        readOnly: true,
                        elevation: 6.0,
                        prefixIcon: AppImageWidget(
                          height: AppDimens.height_20,
                          path: ImageConstants.icMail,
                          width: AppDimens.height_20,
                        ),
                      ),
                      SizedBox(
                        height: AppDimens.height_16,
                      ),
                      AppTextFieldWidget(
                        hintText: controller.user.phone,
                        shadowColor: AppColors.black.withOpacity(0.12),
                        readOnly: true,
                        elevation: 6.0,
                        prefixIcon: AppImageWidget(
                          height: AppDimens.height_16,
                          path: ImageConstants.icPhone,
                          width: AppDimens.height_16,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          Container(
            padding: EdgeInsets.only(top: AppDimens.height_20),
            alignment: Alignment.topCenter,
            child: AvatarWidget(
              path: controller.user.avatar ?? ImageConstants.icDefaultAvatar,
            ),
          )
        ],
      ),
    );
  }
}
