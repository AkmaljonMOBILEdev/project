import 'package:e_commerce/data/models/one_call/weather_model_by_one_call.dart';
import 'package:e_commerce/data/models/universal_response.dart';
import 'package:e_commerce/data/network/providers/apiprovider.dart';

class Repo{
  Future<WeatherModelByOneCall?> fetchWe()async{
    UniversalResponse universalResponse = await ApiProvider().getWeatherByOneCall(lat: 41.22, lon: 69.24);
    if(universalResponse.error.isEmpty){
      return universalResponse.data as WeatherModelByOneCall;
    }
  }
}