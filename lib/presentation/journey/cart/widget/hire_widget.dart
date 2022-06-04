import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_base_code/common/common_export.dart';
import 'package:getx_base_code/common/constants/format_constants.dart';
import 'package:getx_base_code/common/extensions/calender_extensions.dart';
import 'package:getx_base_code/common/utils/comon_utils.dart';
import 'package:getx_base_code/presentation/journey/cart/cart_controller.dart';
import 'package:getx_base_code/presentation/journey/cart/widget/select_calender_widget.dart';
import 'package:getx_base_code/presentation/theme/export.dart';
import 'package:getx_base_code/presentation/widgets/app_date_time_picker.dart';
import 'package:getx_base_code/presentation/widgets/export.dart';

class HireWidget extends GetView<CartController> {
  const HireWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width - AppDimens.height_12;
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
            color: AppColors.white,
            borderRadius:
                BorderRadius.all(Radius.circular(AppDimens.radius_20))),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppDimens.width_16, vertical: AppDimens.height_20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: AppDimens.height_44,
                child: Row(
                  children: [
                    Text(
                      'Buổi',
                      style: ThemeText.subtitle2
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: AppDimens.width_12,
                    ),
                    Expanded(
                      child: InkWell(
                          onTap: () => _selectCalender(context),
                          child: Obx(
                            () => Text(
                              controller.rxCalender.value.label,
                              style: ThemeText.subtitle2,
                            ),
                          )),
                    ),
                  ],
                ),
              ),
              const Divider(
                height: 1,
              ),
              SizedBox(
                height: AppDimens.height_44,
                child: Row(
                  children: [
                    Text(
                      'Ngày',
                      style: ThemeText.subtitle2
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: AppDimens.width_12,
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () => _selectDate(context),
                        child: Obx(
                          () => Text(
                            dateFormatter(FormatConstants.formatddMMyyyyy,
                                controller.hireDate.value),
                            style: ThemeText.subtitle2,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: AppDimens.height_16),
                child: const Divider(
                  height: 1,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: AppButton.flexWidth(
                      loaded: controller.rxLoadedType.value,
                      title: 'Đặt mượn',
                      onPressed: controller.hireBook,
                      width: width,
                    ),
                  ),
                  SizedBox(
                    width: AppDimens.width_12,
                  ),
                  Expanded(
                    child: AppButton.flexWidth(
                      loaded: controller.rxLoadedType.value,
                      title: 'Hủy',
                      width: width,
                      backgroundColor: AppColors.red,
                      onPressed: () => Get.back(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _selectDate(BuildContext context) {
    CommonUtils.showBottomSheet(
        context: context,
        body: AppDateTimePicker(
            mode: CupertinoDatePickerMode.date,
            onChange: (value) {
              controller.hireDate.value = value;
            },
            onDone: () {
              Get.back();
            }));
  }

  void _selectCalender(BuildContext context) {
    CommonUtils.showBottomSheet(
      context: context,
      body: SelectCalenderWidget(
        onTap: (value) {
          Get.back();
          controller.rxCalender.value = value;
        },
        current: controller.rxCalender.value,
      ),
    );
  }
}
