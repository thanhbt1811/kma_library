import 'package:get/get.dart';
import 'package:getx_base_code/common/common_export.dart';
import 'package:getx_base_code/common/utils/comon_utils.dart';
import 'package:getx_base_code/common/utils/image_compress.dart';
import 'package:getx_base_code/domain/models/user_model.dart';
import 'package:getx_base_code/domain/usecases/authentication_usecase.dart';
import 'package:getx_base_code/domain/usecases/image_use_case.dart';
import 'package:getx_base_code/domain/usecases/user_usecase.dart';
import 'package:getx_base_code/presentation/controllers/app_controller.dart';
import 'package:getx_base_code/presentation/controllers/core_controller.dart';
import 'package:getx_base_code/presentation/widgets/app_crop_image.dart';

class ProfileController extends CoreController {
  final AuthenticationUsecase _authenticationUsecase;
  final ImageUseCase _imageUseCase;
  final UserUsecase _userUsecase;
  RxBool rxActiveNoti = false.obs;
  Rx<UserModel> user = Get.find<AppController>().user.obs;

  ProfileController(
      this._authenticationUsecase, this._imageUseCase, this._userUsecase);

  void setRxActiveNoti() {
    rxActiveNoti.value = !rxActiveNoti.value;
  }

  Future<void> onLogOut() async {
    _authenticationUsecase.logout();
    Get.offAllNamed(AppRoutes.login);
  }

  Future<void> openCamera() async {
    final image = await _imageUseCase.openCamera(context);
    if (image != null) {
      CommonUtils.showBottomSheet(
        context: context,
        body: CropImage(
          isCircleUi: true,
          image: image,
          onCrop: (image) async {
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
