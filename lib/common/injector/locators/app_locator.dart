import 'package:get_it/get_it.dart';
import 'package:getx_base_code/common/common_export.dart';
import 'package:getx_base_code/common/injector/bindings/auth_binding.dart';
import 'package:getx_base_code/common/injector/bindings/book_bindings.dart';
import 'package:getx_base_code/common/injector/bindings/favorite_binding.dart';
import 'package:getx_base_code/common/injector/bindings/profile_binding.dart';
import 'package:getx_base_code/data/local_repository.dart';
import 'package:getx_base_code/data/remote/authentication_repository.dart';
import 'package:getx_base_code/data/remote/book_repository.dart';
import 'package:getx_base_code/data/remote/category_repository.dart';
import 'package:getx_base_code/domain/usecases/authentication_usecase.dart';
import 'package:getx_base_code/domain/usecases/book_usecase.dart';
import 'package:getx_base_code/domain/usecases/category_usecase.dart';
import 'package:getx_base_code/presentation/controllers/app_controller.dart';
import 'package:getx_base_code/presentation/journey/auth/forgot_password/forgot_password_controller.dart';
import 'package:getx_base_code/presentation/journey/auth/login/login_controller.dart';
import 'package:getx_base_code/presentation/journey/book/book_detal/book_detail_controller.dart';
import 'package:getx_base_code/presentation/journey/book/book_list/book_list_controller.dart';
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
  getIt.registerFactory<BookDetailBinding>(
    () => BookDetailBinding(),
  );
  getIt.registerFactory<BookListBindings>(
    () => BookListBindings(),
  );

  /// Controllers
  getIt.registerLazySingleton<AppController>(
    () => AppController(),
  );
  getIt.registerFactory<SplashController>(
    () => SplashController(getIt<AuthenticationUsecase>()),
  );
  getIt.registerFactory<MainController>(
    () => MainController(),
  );
  getIt.registerFactory<HomeController>(
    () => HomeController(
      getIt<CategoryUsecase>(),
    ),
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
  getIt.registerFactory<LoginController>(
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
  getIt.registerFactory<BookDetailController>(
    () => BookDetailController(),
  );
  getIt.registerFactory<BookListController>(
    () => BookListController(
      getIt<BookUsecase>(),
    ),
  );

  /// UseCases
  getIt.registerFactory<AuthenticationUsecase>(
    () => AuthenticationUsecase(
      getIt<AuthenticationRepository>(),
      getIt<LocalRepository>(),
    ),
  );
  getIt.registerFactory<CategoryUsecase>(
    () => CategoryUsecase(
      getIt<CategoryRepository>(),
    ),
  );
  getIt.registerFactory<BookUsecase>(
    () => BookUsecase(
      getIt<BookRepository>(),
    ),
  );

  /// Repositories
  getIt.registerFactory<AuthenticationRepository>(
    () => AuthenticationRepository(
      getIt<ApiClient>(),
    ),
  );
  getIt.registerFactory<CategoryRepository>(
    () => CategoryRepository(
      getIt<ApiClient>(),
    ),
  );
  getIt.registerFactory<BookRepository>(
    () => BookRepository(
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
