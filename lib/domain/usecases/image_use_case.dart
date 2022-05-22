import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:getx_base_code/common/utils/image_compress.dart';
import 'package:getx_base_code/data/local/image_local_repository.dart';

class ImageUseCase {
  final ImageLocalRepository _imageLocalRepository;

  ImageUseCase(this._imageLocalRepository);

  Future<Uint8List?> openCamera(BuildContext context) async {
    final res = await _imageLocalRepository.openCamera();
    if (res != null) {
      final image = ImageCompress.compressWithFile(File(res.path), 100);
      return image;
    }
    return null;
  }

  Future<Uint8List?> openGallery(BuildContext context) async {
    final res = await _imageLocalRepository.openGallery();
    if (res != null) {
      final image = ImageCompress.compressWithFile(File(res.path), 100);
      return image;
    }
    return null;
  }
}
