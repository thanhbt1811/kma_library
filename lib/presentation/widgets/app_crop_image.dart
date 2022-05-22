import 'dart:typed_data';
import 'package:crop_your_image/crop_your_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_base_code/common/common_export.dart';
import 'package:getx_base_code/presentation/theme/export.dart';
import 'package:getx_base_code/presentation/widgets/export.dart';

class CropImage extends StatelessWidget {
  CropImage({
    required this.isCircleUi,
    required this.image,
    required this.onCrop,
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);
  final CropController _controller = CropController();
  final double width;
  final double height;
  final Uint8List image;
  final bool isCircleUi;
  final Function(Uint8List) onCrop;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Crop(
            controller: _controller,
            initialArea: sizeImage(),
            withCircleUi: isCircleUi,
            image: image,
            onCropped: onCrop,
          ),
        ),
        const Divider(
          height: 1,
        ),
        AppTouchable(
          height: AppDimens.height_52,
          width: double.infinity,
          onPressed: () {
            if (isCircleUi) {
              _controller.cropCircle();
            } else {
              _controller.crop();
            }
            Get.back();
          },
          child: Text(
            'Cắt',
            style: ThemeText.bodyText2,
          ),
        ),
      ],
    );
  }

  Rect sizeImage() {
    if (isCircleUi) {
      if (width < height) {
        return Rect.fromLTWH(0, 0, width, width);
      } else {
        return Rect.fromLTWH(0, 0, height, height);
      }
    }
    return Rect.fromLTWH(0, 0, width, height);
  }
}
