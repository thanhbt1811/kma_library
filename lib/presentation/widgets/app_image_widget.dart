import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:getx_base_code/common/common_export.dart';
import 'package:getx_base_code/presentation/theme/export.dart';
import 'package:lottie/lottie.dart';

class AppImageWidget extends StatelessWidget {
  final String path;
  bool isAsset = false;
  Widget? placeholder;
  Widget? errorWidget;
  final BoxFit? fit;
  final double? width;
  final double? height;
  final Color? color;
  double? loadingSize;

  AppImageWidget({
    Key? key,
    required this.path,
    this.placeholder,
    this.errorWidget,
    this.fit,
    this.width,
    this.height,
    this.loadingSize,
    this.color,
  }) : super(key: key);

  Widget get _placeholder {
    return Center(
        child: SizedBox(
      width: loadingSize ?? AppDimens.space_20,
      height: loadingSize ?? AppDimens.space_20,
      child: const CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
        strokeWidth: 2,
      ),
    ));
  }

  Widget get _errorWidget {
    return const Icon(Icons.error);
  }

  Widget _buildLottieImageWidget() {
    if (isAsset) {
      return Lottie.asset(
        path,
        fit: fit,
        width: width,
        height: height,
      );
    }
    return Lottie.network(
      path,
      fit: fit,
      width: width,
      height: height,
      errorBuilder: (context, error, stackTrace) {
        return errorWidget ?? _errorWidget;
      },
      frameBuilder: (context, child, composition) {
        if (composition != null) {
          return Lottie(composition: composition);
        } else {
          return placeholder ?? _placeholder;
        }
      },
    );
  }

  Widget _buildSvgImageWidget() {
    if (isAsset) {
      return SvgPicture.asset(
        path,
        fit: fit ?? BoxFit.contain,
        width: width,
        height: height,
        color: color,
      );
    }
    return SvgPicture.network(
      path,
      fit: fit ?? BoxFit.contain,
      width: width,
      height: height,
      color: color,
      placeholderBuilder: (context) => placeholder ?? _placeholder,
      // headers: {
      //   'auth-token': SessionData.authToken,
      // },
    );
  }

  Widget _buildNormalImageWidget() {
    if (isAsset) {
      return Image.asset(
        path,
        fit: fit,
        width: width,
        height: height,
      );
    }
    return CachedNetworkImage(
      imageUrl: path,
      fit: fit,
      width: width,
      height: height,
      placeholder: (context, url) => placeholder ?? _placeholder,
      errorWidget: (context, url, error) {
        return errorWidget ?? _errorWidget;
      },
      cacheManager: CacheManager(
        Config(
          'ImageCacheKey',
          stalePeriod: const Duration(days: 1),
        ),
      ),
      // httpHeaders: {
      //   'auth-token': SessionData.authToken,
      // },
    );
  }

  @override
  Widget build(BuildContext context) {
    isAsset = checkAsset();
    switch (imageType) {
      case ImageType.lottie:
        return _buildLottieImageWidget();
      case ImageType.svg:
        return _buildSvgImageWidget();
      default:
        return _buildNormalImageWidget();
    }
  }

  ImageType get imageType {
    int length = path.length;
    String lastString = path.substring(length - 5).toUpperCase();
    if (lastString.contains('.json'.toUpperCase())) {
      return ImageType.lottie;
    } else if (lastString.contains('.svg'.toUpperCase())) {
      return ImageType.svg;
    } else {
      return ImageType.image;
    }
  }

  bool checkAsset() {
    if (path.contains('http://') || path.contains('https://')) {
      return false;
    }
    return true;
  }
}

enum ImageType { svg, image, lottie }
