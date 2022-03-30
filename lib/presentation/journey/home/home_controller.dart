import 'package:get/get.dart';
import 'package:getx_base_code/common/common_export.dart';
import 'package:getx_base_code/domain/models/covid19_summary_response.dart';
import 'package:getx_base_code/domain/usecases/weather_usecase.dart';
import 'package:getx_base_code/presentation/controllers/mixin/export.dart';

class HomeController extends GetxController with MixinController {
  final WeatherUseCase weatherUc;

  HomeController({required this.weatherUc});

  @override
  Future<void> onReady() async {
    super.onReady();
    Covid19SummaryGlobalModel globalSummary = await weatherUc.getCovid19SummaryGlobal();
    logger('totalRecovered: ${globalSummary.totalRecovered}');
  }
}