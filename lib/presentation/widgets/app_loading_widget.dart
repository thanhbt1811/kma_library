import 'package:flutter/cupertino.dart';
import 'package:getx_base_code/common/common_export.dart';
import 'package:getx_base_code/presentation/theme/export.dart';

class AppLoadingWidget extends StatelessWidget {
  final double? width;
  final Color? color;

  const AppLoadingWidget({Key? key, this.width, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: CupertinoActivityIndicator(
        radius: width ?? AppDimens.space_8,
        color: color ?? AppColors.white,
      ),
    );
  }
}
