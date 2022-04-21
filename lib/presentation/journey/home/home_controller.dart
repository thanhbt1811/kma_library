import 'package:get/get.dart';
import 'package:getx_base_code/domain/usecases/weather_usecase.dart';
import 'package:getx_base_code/presentation/controllers/mixin/export.dart';

class HomeController extends GetxController with MixinController {
  final WeatherUseCase weatherUc;

  HomeController({required this.weatherUc});
}
