import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_base_code/common/common_export.dart';
import 'package:getx_base_code/presentation/theme/export.dart';
import 'package:getx_base_code/presentation/widgets/export.dart';

class AppImagePicker extends StatelessWidget {
  final Function() onCamera;
  final Function() onGallery;
  const AppImagePicker(
      {Key? key, required this.onCamera, required this.onGallery})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        AppTouchable(
          height: AppDimens.height_52,
          width: double.infinity,
          onPressed: onCamera,
          child: Text(
            'Máy ảnh',
            style: ThemeText.bodyText2,
          ),
        ),
        const Divider(
          height: 1,
        ),
        AppTouchable(
          height: AppDimens.height_52,
          width: double.infinity,
          onPressed: onGallery,
          child: Text(
            'Thư viện',
            style: ThemeText.bodyText2,
          ),
        ),
        const Divider(
          height: 1,
        ),
        AppTouchable(
          height: AppDimens.height_52,
          width: double.infinity,
          onPressed: () => Get.back(),
          child: Text(
            'Hủy bỏ',
            style: ThemeText.bodyText2.copyWith(color: AppColors.red),
          ),
        ),
      ]),
    );
  }
}
