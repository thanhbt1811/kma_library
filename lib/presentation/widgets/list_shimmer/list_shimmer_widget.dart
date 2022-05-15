import 'package:flutter/material.dart';
import 'package:getx_base_code/common/common_export.dart';
import 'package:getx_base_code/presentation/theme/export.dart';
import 'package:getx_base_code/presentation/widgets/app_shimmer.dart';
import 'package:shimmer/shimmer.dart';

class ListShimmerWidget extends StatelessWidget {
  const ListShimmerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Shimmer.fromColors(
      baseColor: AppColors.grey200!,
      highlightColor: AppColors.grey100!,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(
            horizontal: AppDimens.width_16, vertical: AppDimens.height_20),
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: AppDimens.height_8),
            child: AppShimmer(
              width: width,
              height: AppDimens.height_112,
            ),
          );
        },
        itemCount: 10,
      ),
    );
  }
}
