import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_base_code/common/common_export.dart';
import 'package:getx_base_code/presentation/journey/auth/news/news_controller.dart';
import 'package:getx_base_code/presentation/journey/auth/news/widget/news_item.dart';
import 'package:getx_base_code/presentation/theme/export.dart';
import 'package:getx_base_code/presentation/widgets/app_empty_widget.dart';
import 'package:getx_base_code/presentation/widgets/app_refresh_widget.dart';
import 'package:getx_base_code/presentation/widgets/app_scaffold.dart';
import 'package:getx_base_code/presentation/widgets/appbar_widget.dart';
import 'package:getx_base_code/presentation/widgets/export.dart';
import 'package:getx_base_code/presentation/widgets/list_shimmer/list_shimmer_widget.dart';

class NewsScreen extends GetView<NewsController> {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.context = context;
    return AppScaffold(
      appBar: AppBarWidget(
        title: Text(
          'Thông báo',
          style: ThemeText.headline6
              .copyWith(fontSize: AppDimens.space_18, color: AppColors.white),
          textAlign: TextAlign.left,
        ),
        leading: AppBarButton(
          iconSource: ImageConstants.icArrowLeft,
          onTap: () => Get.back(),
        ),
      ),
      body: Obx(
        () => AppRefreshWidget(
          enableLoadMore: controller.hasLoadMore.value,
          onRefresh: controller.onRefresh,
          onLoadMore: controller.onLoadmore,
          controller: controller.refreshController,
          child: _buildNotiesList(),
          footer: AppLoadingWidget(
            width: AppDimens.height_20,
          ),
        ),
      ),
    );
  }

  Widget _buildNotiesList() {
    if (controller.rxLoadedType.value == LoadedType.start) {
      return const ListShimmerWidget();
    } else if (controller.noties.isEmpty) {
      return const Center(child: AppEmptyWidget());
    } else {
      final noties = controller.noties;
      return ListView.separated(
          padding: EdgeInsets.symmetric(
              horizontal: AppDimens.width_16, vertical: AppDimens.height_16),
          itemBuilder: (context, index) {
            final noti = noties[index];
            return NewsItem(
              noti: noti,
            );
          },
          separatorBuilder: (context, index) => SizedBox(
                height: AppDimens.height_16,
              ),
          itemCount: noties.length);
    }
  }
}
