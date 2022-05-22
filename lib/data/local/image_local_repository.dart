import 'package:image_picker/image_picker.dart';

class ImageLocalRepository {
  final ImagePicker _imagePicker;

  ImageLocalRepository(this._imagePicker);

  Future<XFile?> openCamera() async {
    final res = await _imagePicker.pickImage(source: ImageSource.camera);
    return res;
  }

  Future<XFile?> openGallery() async {
    final res = await _imagePicker.pickImage(source: ImageSource.gallery);
    return res;
  }
}
