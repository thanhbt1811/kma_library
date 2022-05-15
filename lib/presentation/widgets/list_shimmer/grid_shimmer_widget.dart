import 'package:flutter/material.dart';
import 'package:getx_base_code/common/common_export.dart';
import 'package:getx_base_code/presentation/theme/export.dart';
import 'package:getx_base_code/presentation/widgets/export.dart';
import 'package:shimmer/shimmer.dart';

class GridShimmerWidget extends StatelessWidget {
  const GridShimmerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.grey200!,
      highlightColor: AppColors.grey100!,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(
            horizontal: AppDimens.width_16, vertical: AppDimens.height_20),
        itemBuilder: (gridContext, index) {
          final width = MediaQuery.of(gridContext).size.width;
          return GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: AppDimens.height_16,
            mainAxisSpacing: AppDimens.space_16,
            shrinkWrap: true,
            children: List.generate(10, (index) {
              return Column(
                children: [
                  AppShimmer(
                    height: AppDimens.height_120,
                    width: width,
                  ),
                  SizedBox(
                    height: AppDimens.height_8,
                  ),
                  AppShimmer(
                    height: AppDimens.height_12,
                  )
                ],
              );
            }),
          );
        },
        itemCount: 10,
      ),
    );
  }
}
