import 'package:getx_base_code/common/common_export.dart';
import 'package:getx_base_code/data/api_constans.dart';

class WeatherRepository {
  Future<Map<String, dynamic>> getCovid19Summary() async {
    var baseRes =
        await ApiClient().request(path: ApiConstants.getCovid19Summary);
    return baseRes.data as Map<String, dynamic>;
  }
}
