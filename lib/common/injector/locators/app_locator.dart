import 'package:get_it/get_it.dart';
import 'package:getx_base_code/common/common_export.dart';
import 'package:getx_base_code/common/injector/bindings/auth_binding.dart';
import 'package:getx_base_code/common/injector/bindings/book_bindings.dart';
import 'package:getx_base_code/common/injector/bindings/profile_binding.dart';
import 'package:getx_base_code/data/local/image_local_repository.dart';
import 'package:getx_base_code/data/local_repository.dart';
import 'package:getx_base_code/data/remote/authentication_repository.dart';
import 'package:getx_base_code/data/remote/book_repository.dart';
import 'package:getx_base_code/data/remote/category_repository.dart';
import 'package:getx_base_code/data/remote/notification_repository.dart';
import 'package:getx_base_code/data/remote/user_repository.dart';
import 'package:getx_base_code/domain/usecases/authentication_usecase.dart';
import 'package:getx_base_code/domain/usecases/book_usecase.dart';
import 'package:getx_base_code/domain/usecases/category_usecase.dart';
import 'package:getx_base_code/domain/usecases/image_use_case.dart';
import 'package:getx_base_code/domain/usecases/notification_usecase.dart';
import 'package:getx_base_code/domain/usecases/user_usecase.dart';
import 'package:getx_base_code/presentation/controllers/app_controller.dart';
import 'package:getx_base_code/presentation/journey/auth/forgot_password/forgot_password_controller.dart';
import 'package:getx_base_code/presentation/journey/auth/login/login_controller.dart';
import 'package:getx_base_code/presentation/journey/book/book_list/book_list_controller.dart';
import 'package:getx_base_code/presentation/journey/book/read_book/read_book_controller.dart';
import 'package:getx_base_code/presentation/journey/cart/cart_controller.dart';
import 'package:getx_base_code/presentation/journey/home/home_controller.dart';
import 'package:getx_base_code/presentation/journey/main/main_controller.dart';
import 'package:getx_base_code/presentation/journey/notification/notification_controller.dart';
import 'package:getx_base_code/presentation/journey/profile/change_password/change_password_controller.dart';
import 'package:getx_base_code/presentation/journey/profile/history/history_controller.dart';
import 'package:getx_base_code/presentation/journey/profile/my_profile/my_profile_controller.dart';
import 'package:getx_base_code/presentation/journey/profile/profile_controller.dart';
import 'package:getx_base_code/presentation/journey/profile/returned/returned_controller.dart';
import 'package:getx_base_code/presentation/journey/splash/splash_controller.dart';
import 'package:image_picker/image_picker.dart';

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
  getIt.registerFactory<ProfileBinding>(
    () => ProfileBinding(),
  );
  getIt.registerFactory<MyProfileBindings>(
    () => MyProfileBindings(),
  );
  getIt.registerFactory<HistoryBidings>(
    () => HistoryBidings(),
  );
  getIt.registerFactory<ReturnedBindings>(
    () => ReturnedBindings(),
  );

  getIt.registerFactory<BookDetailBinding>(
    () => BookDetailBinding(),
  );
  getIt.registerFactory<BookListBindings>(
    () => BookListBindings(),
  );
  getIt.registerFactory<ReadBookBinding>(
    () => ReadBookBinding(),
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
    () => NotificationController(
      getIt<NotificationUsecase>(),
    ),
  );
  getIt.registerFactory<CartController>(
    () => CartController(
      getIt<BookUsecase>(),
    ),
  );
  getIt.registerFactory<ProfileController>(
    () => ProfileController(getIt<AuthenticationUsecase>(),
        getIt<ImageUseCase>(), getIt<UserUsecase>()),
  );
  getIt.registerFactory<MyProfileController>(
    () => MyProfileController(
      getIt<ImageUseCase>(),
      getIt<UserUsecase>(),
    ),
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
    () => ReturnedController(
      getIt<BookUsecase>(),
    ),
  );
  getIt.registerFactory(
    () => HistoryController(
      getIt<BookUsecase>(),
    ),
  );
  // getIt.registerFactory<BookDetailController>(
  //   () => BookDetailController(
  //     getIt<BookUsecase>(),
  //   ),
  // );
  getIt.registerFactory<BookListController>(
    () => BookListController(
      getIt<BookUsecase>(),
    ),
  );
  getIt.registerFactory<ReadBookController>(
    () => ReadBookController(),
  );

  /// UseCases
  getIt.registerFactory<AuthenticationUsecase>(
    () => AuthenticationUsecase(getIt<AuthenticationRepository>(),
        getIt<LocalRepository>(), getIt<UserRepository>()),
  );
  getIt.registerFactory(
    () => UserUsecase(
      getIt<UserRepository>(),
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
  getIt.registerFactory(
    () => ImageUseCase(
      getIt<ImageLocalRepository>(),
    ),
  );
  getIt.registerFactory<NotificationUsecase>(
    () => NotificationUsecase(
      getIt<NotificationRepository>(),
    ),
  );

  /// Repositories
  getIt.registerFactory<AuthenticationRepository>(
    () => AuthenticationRepository(
      getIt<ApiClient>(),
    ),
  );
  getIt.registerFactory(
    () => UserRepository(
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
  getIt.registerFactory(
    () => ImageLocalRepository(
      getIt<ImagePicker>(),
    ),
  );
  getIt.registerFactory<NotificationRepository>(
    () => NotificationRepository(
      getIt<ApiClient>(),
    ),
  );

  ///Common
  getIt.registerSingleton(
    ApiClient(),
  );
  getIt.registerSingleton(
    ImagePicker(),
  );
}
