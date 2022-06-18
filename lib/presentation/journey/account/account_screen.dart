import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_base_code/common/common_export.dart';
import 'package:getx_base_code/common/injector/bindings/profile_binding.dart';
import 'package:getx_base_code/presentation/journey/profile/estimate_return_book/estimate_return_book_screen.dart';
import 'package:getx_base_code/presentation/journey/profile/estimating_book/estimating_book_screen.dart';
import 'package:getx_base_code/presentation/journey/profile/history/history_screen.dart';
import 'package:getx_base_code/presentation/journey/profile/my_profile/my_profile_screen.dart';
import 'package:getx_base_code/presentation/journey/profile/profile_screen.dart';
import 'package:getx_base_code/presentation/journey/profile/returned/returned_screen.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(BottomNavigationType.profile.index),
      onGenerateRoute: (settings) {
        Get.routing.args = settings.arguments;
        switch (settings.name) {
          case AppRoutes.myProfiel:
            return GetPageRoute(
              settings: settings,
              routeName: AppRoutes.myProfiel,
              page: () => const MyProfileScreen(),
              binding: MyProfileBindings(),
            );
          case AppRoutes.estimateReturn:
            return GetPageRoute(
              settings: settings,
              routeName: AppRoutes.estimateReturn,
              page: () => const EstimateReturnBookScreen(),
              binding: EstimateReturnBookBindings(),
            );
          case AppRoutes.estimatingBook:
            return GetPageRoute(
              settings: settings,
              routeName: AppRoutes.estimatingBook,
              page: () => const EstimatingBookScreen(),
              binding: EstimatingBookBindings(),
            );
          case AppRoutes.history:
            return GetPageRoute(
              settings: settings,
              routeName: AppRoutes.history,
              page: () => const HistoryScreen(),
              binding: HistoryBidings(),
            );
          case AppRoutes.historyOrder:
            return GetPageRoute(
              settings: settings,
              routeName: AppRoutes.historyOrder,
              page: () => const ReturnedScreen(),
              binding: ReturnedBindings(),
            );
          default:
            return GetPageRoute(
              settings: settings,
              routeName: AppRoutes.profile,
              page: () => const ProfileScreen(),
              binding: ProfileBinding(),
            );
        }
      },
    );
  }
}
