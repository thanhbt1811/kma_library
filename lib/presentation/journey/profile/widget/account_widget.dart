import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_base_code/common/common_export.dart';
import 'package:getx_base_code/presentation/journey/profile/profile_controller.dart';
import 'package:getx_base_code/presentation/journey/profile/widget/avatar_widget.dart';
import 'package:getx_base_code/presentation/theme/export.dart';

class AccountWidget extends GetView<ProfileController> {
  const AccountWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppDimens.width_16)
          .copyWith(top: AppDimens.height_20),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          AvatarWidget(
            path: controller.user.avatar,
            updateAvatar: () => _updateAvatar(context),
          ),
          SizedBox(
            width: AppDimens.width_16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                controller.user.name,
                style: ThemeText.subtitle1,
              ),
              SizedBox(height: AppDimens.height_4),
              // Text(
              //   'Khoa: Công nghệ thông tin',
              //   style:
              //       ThemeText.subtitle2.copyWith(fontWeight: FontWeight.w400),
              // ),
              SizedBox(height: AppDimens.height_4),
              Text(
                'Mã sinh viên: ${controller.user.studentIdenitify}',
                style:
                    ThemeText.subtitle2.copyWith(fontWeight: FontWeight.w400),
              ),
            ],
          )
        ],
      ),
    );
  }

  void _updateAvatar(BuildContext context) {
    // CommonUtils.showBottomSheet(
    //   context: context,
    //   body: AppImagePicker(onCamera: _onCamera, onGallery: _onGallery),
    // );
  }

  void _onCamera() {
    controller.openCamera();
    Get.back();
  }

  void _onGallery() {
    controller.openGallery();
    Get.back();
  }
}
