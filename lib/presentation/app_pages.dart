import 'package:get/get.dart';
import 'package:getx_base_code/common/common_export.dart';
import 'package:getx_base_code/common/injector/bindings/auth_binding.dart';
import 'package:getx_base_code/common/injector/bindings/book_bindings.dart';
import 'package:getx_base_code/common/injector/bindings/favorite_binding.dart';
import 'package:getx_base_code/common/injector/bindings/profile_binding.dart';
import 'package:getx_base_code/presentation/journey/auth/forgot_password/forgot_password_screen.dart';
import 'package:getx_base_code/presentation/journey/auth/login/login_screen.dart';
import 'package:getx_base_code/presentation/journey/book/book_detal/book_detail_screen.dart';
import 'package:getx_base_code/presentation/journey/book/book_list/book_list_screen.dart';
import 'package:getx_base_code/presentation/journey/book/read_book/read_book_screen.dart';
import 'package:getx_base_code/presentation/journey/profile/change_password/change_password_screen.dart';
import 'package:getx_base_code/presentation/journey/profile/history/history_screen.dart';
import 'package:getx_base_code/presentation/journey/profile/history_order/history_order_screen.dart';

import 'journey/main/main_screen.dart';
import 'journey/splash/splash_screen.dart';

List<GetPage> myPages = [
  GetPage(
      name: AppRoutes.splash,
      page: () => const SplashScreen(),
      binding: SplashBinding()),
  GetPage(name: AppRoutes.main, page: () => const MainScreen(), bindings: [
    MainBinding(),
    HomeBinding(),
    NotificationBinding(),
    CartBinding(),
    FavoriteBinding(),
    ProfileBinding(),
  ]),
  GetPage(
    name: AppRoutes.login,
    page: () => const LoginScreen(),
    binding: AuthBinding(),
  ),
  GetPage(
    name: AppRoutes.forgotPassword,
    page: () => const ForgotPasswordScreen(),
    binding: AuthBinding(),
  ),
  GetPage(
    name: AppRoutes.changePassword,
    page: () => const ChangePasswordScreen(),
    binding: ProfileBinding(),
  ),
  GetPage(
    name: AppRoutes.historyOrder,
    page: () => const HistoryOrderScreen(),
    binding: ProfileBinding(),
  ),
  GetPage(
    name: AppRoutes.history,
    page: () => const HistoryScreen(),
    binding: ProfileBinding(),
  ),
  GetPage(
    name: AppRoutes.bookList,
    page: () => const BookListScreen(),
    binding: BookListBindings(),
  ),
  GetPage(
    name: AppRoutes.bookDetail,
    page: () => const BookDetailScreen(),
    binding: BookDetailBinding(),
  ),
  GetPage(
    name: AppRoutes.overViewBook,
    page: () => const ReadBookScreen(),
    binding: ReadBookBindings(),
  )
];
