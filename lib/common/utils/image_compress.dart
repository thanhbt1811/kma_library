import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class ImageCompress {
  static Future<Uint8List> compressWithFile(File file, int quality) async {
    final String filePath = file.absolute.path;
    final Uint8List? result = await FlutterImageCompress.compressWithFile(
      filePath,
      quality: quality,
    );
    if (result != null) {
      return result;
    } else {
      throw Exception('compression failed');
    }
  }

  static Future<File?> compressAndGetFile(File file, int quality) async {
    final String filePath = file.absolute.path;

    final int lastIndex = filePath.lastIndexOf(
      RegExp(r'.jp'),
    );
    final String splitted = filePath.substring(0, lastIndex);
    final String targetPath = '${splitted}_out${filePath.substring(lastIndex)}';

    final File? result = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      targetPath,
      quality: quality,
    );
    if (result != null) {
      return result;
    } else {
      throw Exception('compression failed');
    }
  }

  static Future<Uint8List> compressWithList(
      Uint8List imageToUpload, int quality) async {
    imageToUpload = await FlutterImageCompress.compressWithList(
      imageToUpload,
      quality: quality,
    );
    return imageToUpload;
  }

  static Future<File> compressedFileFunc(
      Uint8List image, String fileName) async {
    final dir = await path_provider.getTemporaryDirectory();
    File file = await File('${dir.path}/$fileName').create();
    file.writeAsBytesSync(image);
    return file;
  }
}
