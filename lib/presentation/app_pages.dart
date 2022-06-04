import 'package:get/get.dart';
import 'package:getx_base_code/common/common_export.dart';
import 'package:getx_base_code/common/injector/bindings/auth_binding.dart';
import 'package:getx_base_code/common/injector/bindings/book_bindings.dart';
import 'package:getx_base_code/common/injector/bindings/profile_binding.dart';
import 'package:getx_base_code/presentation/journey/auth/login/login_screen.dart';
import 'package:getx_base_code/presentation/journey/book/book_detail/book_detail_screen.dart';
import 'package:getx_base_code/presentation/journey/book/book_list/book_list_screen.dart';
import 'package:getx_base_code/presentation/journey/book/read_book/read_book_screen.dart';
import 'package:getx_base_code/presentation/journey/profile/history/history_screen.dart';
import 'package:getx_base_code/presentation/journey/profile/my_profile/my_profile_screen.dart';
import 'package:getx_base_code/presentation/journey/profile/returned/returned_screen.dart';
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
    ProfileBinding(),
  ]),
  GetPage(
    name: AppRoutes.login,
    page: () => const LoginScreen(),
    binding: AuthBinding(),
  ),
  GetPage(
    name: AppRoutes.historyOrder,
    page: () => const ReturnedScreen(),
    binding: ReturnedBindings(),
  ),
  GetPage(
    name: AppRoutes.history,
    page: () => const HistoryScreen(),
    binding: HistoryBidings(),
  ),
  GetPage(
    name: AppRoutes.bookList,
    page: () => BookListScreen(),
    binding: BookListBindings(),
  ),
  GetPage(
    name: AppRoutes.bookDetail,
    page: () => const BookDetailScreen(),
    preventDuplicates: false,
  ),
  GetPage(
    name: AppRoutes.overViewBook,
    page: () => const ReadBookScreen(),
    binding: ReadBookBinding(),
  ),
  GetPage(
    name: AppRoutes.myProfiel,
    page: () => const MyProfileScreen(),
    binding: MyProfileBindings(),
  ),
];
