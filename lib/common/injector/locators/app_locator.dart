import 'package:get_it/get_it.dart';
import 'package:getx_base_code/common/common_export.dart';
import 'package:getx_base_code/common/injector/bindings/auth_binding.dart';
import 'package:getx_base_code/common/injector/bindings/favorite_binding.dart';
import 'package:getx_base_code/common/injector/bindings/profile_binding.dart';
import 'package:getx_base_code/data/local_repository.dart';
import 'package:getx_base_code/data/remote/authentication_repository.dart';
import 'package:getx_base_code/domain/usecases/authentication_usecase.dart';
import 'package:getx_base_code/presentation/controllers/app_controller.dart';
import 'package:getx_base_code/presentation/journey/auth/forgot_password/forgot_password_controller.dart';
import 'package:getx_base_code/presentation/journey/auth/login/login_controller.dart';
import 'package:getx_base_code/presentation/journey/cart/cart_controller.dart';
import 'package:getx_base_code/presentation/journey/favorite/favorite_controller.dart';
import 'package:getx_base_code/presentation/journey/home/home_controller.dart';
import 'package:getx_base_code/presentation/journey/main/main_controller.dart';
import 'package:getx_base_code/presentation/journey/notification/notification_controller.dart';
import 'package:getx_base_code/presentation/journey/profile/change_password/change_password_controller.dart';
import 'package:getx_base_code/presentation/journey/profile/history/history_controller.dart';
import 'package:getx_base_code/presentation/journey/profile/history_order/history_order_controller.dart';
import 'package:getx_base_code/presentation/journey/profile/profile_controller.dart';
import 'package:getx_base_code/presentation/journey/splash/splash_controller.dart';

GetIt getIt = GetIt.instance;

void configLocator() {
  ///Bindinig
  getIt.registerFactory<AuthBinding>(
    () => AuthBinding(),
  );
  getIt.registerFactory<MainBinding>(
    () => MainBinding(),
  );
  getIt.registerFactory<HomeBinding>(
    () => HomeBinding(),
  );
  getIt.registerFactory<NotificationBinding>(
    () => NotificationBinding(),
  );
  getIt.registerFactory<CartBinding>(
    () => CartBinding(),
  );
  getIt.registerFactory<FavoriteBinding>(
    () => FavoriteBinding(),
  );
  getIt.registerFactory<ProfileBinding>(
    () => ProfileBinding(),
  );

  /// Controllers
  getIt.registerLazySingleton<AppController>(
    () => AppController(),
  );
  getIt.registerFactory<SplashController>(
    () => SplashController(),
  );
  getIt.registerFactory<MainController>(
    () => MainController(),
  );
  getIt.registerFactory<HomeController>(
    () => HomeController(),
  );
  getIt.registerFactory<NotificationController>(
    () => NotificationController(),
  );
  getIt.registerFactory<CartController>(
    () => CartController(),
  );
  getIt.registerFactory<FavoriteController>(
    () => FavoriteController(),
  );
  getIt.registerFactory<ProfileController>(
    () => ProfileController(),
  );
  getIt.registerFactory(
    () => LoginController(
      getIt<AuthenticationUsecase>(),
    ),
  );
  getIt.registerFactory(
    () => ForgotPasswordController(),
  );
  getIt.registerFactory(
    () => ChangePasswordController(),
  );
  getIt.registerFactory(
    () => HistoryOrderController(),
  );
  getIt.registerFactory(
    () => HistoryController(),
  );

  /// UseCases
  getIt.registerFactory(
    () => AuthenticationUsecase(
      getIt<AuthenticationRepository>(),
      getIt<LocalRepository>(),
    ),
  );

  /// Repositories
  getIt.registerFactory<AuthenticationRepository>(
    () => AuthenticationRepository(
      getIt<ApiClient>(),
    ),
  );
  getIt.registerFactory<LocalRepository>(
    () => LocalRepository(),
  );

  ///Common
  getIt.registerSingleton(
    ApiClient(),
  );
}
