import 'package:get_it/get_it.dart';
import 'package:getx_base_code/data/local_repository.dart';
import 'package:getx_base_code/data/remote/weather_repository.dart';
import 'package:getx_base_code/domain/usecases/weather_usecase.dart';
import 'package:getx_base_code/presentation/controllers/app_controller.dart';
import 'package:getx_base_code/presentation/journey/home/home_controller.dart';
import 'package:getx_base_code/presentation/journey/main/main_controller.dart';
import 'package:getx_base_code/presentation/journey/splash/splash_controller.dart';

GetIt getIt = GetIt.instance;

void configLocator() {
  /// Controllers
  getIt.registerLazySingleton<AppController>(() => AppController());
  getIt.registerFactory<SplashController>(() => SplashController());
  getIt.registerFactory<MainController>(() => MainController());
  getIt.registerFactory<HomeController>(() => HomeController(weatherUc: getIt<WeatherUseCase>()));

  /// UseCases
  getIt.registerFactory<WeatherUseCase>(() => WeatherUseCase(weatherRepo: getIt<WeatherRepository>()));

  /// Repositories
  getIt.registerFactory<WeatherRepository>(() => WeatherRepository());
  getIt.registerFactory<LocalRepository>(() => LocalRepository());
}
