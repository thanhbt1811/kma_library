import 'package:get/get.dart';
import 'package:getx_base_code/common/constants/enums.dart';
import 'package:getx_base_code/common/utils/comon_utils.dart';
import 'package:getx_base_code/common/utils/image_compress.dart';
import 'package:getx_base_code/domain/models/user_model.dart';
import 'package:getx_base_code/domain/usecases/image_use_case.dart';
import 'package:getx_base_code/domain/usecases/user_usecase.dart';
import 'package:getx_base_code/presentation/controllers/app_controller.dart';
import 'package:getx_base_code/presentation/controllers/core_controller.dart';
import 'package:getx_base_code/presentation/widgets/app_crop_image.dart';

class MyProfileController extends CoreController {
  final ImageUseCase _imageUseCase;
  final UserUsecase _userUsecase;
  Rx<UserModel> user = Get.find<AppController>().user.obs;

  MyProfileController(this._imageUseCase, this._userUsecase);

  Future<void> openCamera() async {
    final image = await _imageUseCase.openCamera(context);
    if (image != null) {
      CommonUtils.showBottomSheet(
        context: context,
        body: CropImage(
          isCircleUi: true,
          image: image,
          onCrop: (image) async {
            Get.back(id: BottomNavigationType.profile.index);
            final file =
                await ImageCompress.compressedFileFunc(image, 'avatar.png');
            startLoading();
            final res = await _userUsecase.uploadAvatar(context, file);
            if (res != null) {
              user.value = res;
              Get.find<AppController>().user = res;
            }
            finishLoading();
          },
          width: 446,
          height: 446,
        ),
      );
    }
  }

  Future<void> openGallery() async {
    final image = await _imageUseCase.openGallery(context);
    if (image != null) {
      CommonUtils.showBottomSheet(
        context: context,
        body: CropImage(
            isCircleUi: true,
            image: image,
            onCrop: (image) async {
              Get.back(id: BottomNavigationType.profile.index);
              final file =
                  await ImageCompress.compressedFileFunc(image, 'avatar.png');
              startLoading();
              final res = await _userUsecase.uploadAvatar(context, file);
              if (res != null) {
                user.value = res;
                Get.find<AppController>().user = res;
              }
              finishLoading();
            },
            width: 446,
            height: 446),
      );
    }
  }
}
