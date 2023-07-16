import 'package:e_commerce/data/models/universal_response.dart';
import 'package:e_commerce/data/network/providers/apiprovider.dart';

import '../../models/main_weather_model/main_weather_model.dart';

class WeatherRepository {
  Future<MainWeatherModel?> getWeatherByLatAndLon(
      {required double lat, required double lon}) async {
    UniversalResponse universalResponse =
        await ApiProvider().getWeatherInfoByLonLat(lat: lat, lon: lon);
    if (universalResponse.error.isEmpty) {
      return universalResponse.data as MainWeatherModel;
    }
    return null;
  }

  Future<MainWeatherModel?> getWeatherByQuery({required String query}) async {
    UniversalResponse universalResponse =
        await ApiProvider().getWeatherInfoByQuery(query: query);
    if(universalResponse.error.isEmpty){
      return universalResponse.data as MainWeatherModel;
    }
    return null;
  }
}
