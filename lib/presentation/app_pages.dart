import 'package:get/get.dart';
import 'package:getx_base_code/common/common_export.dart';
import 'package:getx_base_code/common/injector/bindings/auth_binding.dart';
import 'package:getx_base_code/common/injector/bindings/profile_binding.dart';
import 'package:getx_base_code/presentation/journey/auth/login/login_screen.dart';
import 'package:getx_base_code/presentation/journey/auth/news/new_detail/new_detail_screen.dart';
import 'package:getx_base_code/presentation/journey/auth/news/news_screen.dart';

import 'journey/main/main_screen.dart';
import 'journey/splash/splash_screen.dart';

List<GetPage> myPages = [
  GetPage(
      name: AppRoutes.splash,
      page: () => const SplashScreen(),
      binding: SplashBinding()),
  GetPage(
    name: AppRoutes.main,
    page: () => const MainScreen(),
    bindings: [
      MainBinding(),
      HomeBinding(),
      NotificationBinding(),
      CartBinding(),
      ProfileBinding(),
    ],
  ),
  GetPage(
    name: AppRoutes.login,
    page: () => const LoginScreen(),
    binding: AuthBinding(),
  ),
  GetPage(
    name: AppRoutes.news,
    page: () => const NewsScreen(),
    binding: getIt<NewsBindings>(),
  ),
  GetPage(
    name: AppRoutes.newsDetail,
    page: () => const NewDetailScreen(),
    binding: getIt<NewsDetailBindings>(),
  ),
];
