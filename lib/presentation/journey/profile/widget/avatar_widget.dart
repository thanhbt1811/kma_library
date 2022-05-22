import 'package:flutter/material.dart';
import 'package:getx_base_code/common/constants/constants_export.dart';
import 'package:getx_base_code/presentation/theme/export.dart';
import 'package:getx_base_code/presentation/widgets/app_image_widget.dart';

class AvatarWidget extends StatelessWidget {
  final String? path;
  final Function()? updateAvatar;
  const AvatarWidget({Key? key, this.path, this.updateAvatar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: updateAvatar,
      child: Stack(
        children: [
          AppImageWidget(
            fit: BoxFit.cover,
            isCircle: true,
            path: path ?? ImageConstants.icDefaultAvatar,
            height: AppDimens.height_120,
            width: AppDimens.height_120,
            errorWidget: AppImageWidget(
              path: ImageConstants.icDefaultAvatar,
              height: AppDimens.height_120,
              width: AppDimens.height_120,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.white,
                shape: BoxShape.circle,
              ),
              padding: EdgeInsets.all(AppDimens.height_8),
              child: AppImageWidget(
                path: ImageConstants.icCamera,
                color: AppColors.disableColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
