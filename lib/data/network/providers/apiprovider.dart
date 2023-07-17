import 'dart:convert';
import 'package:e_commerce/data/models/main_weather_model/main_weather_model.dart';
import 'package:e_commerce/data/models/one_call/weather_model_by_one_call.dart';
import 'package:e_commerce/utils/constants.dart';
import 'package:http/http.dart';
import '../../models/universal_response.dart';

class ApiProvider {
  Future<UniversalResponse> getWeatherByOneCall({
         required double lat, required double lon
      })async{
    Uri uri = Uri.https(baseUrlForHttps,
        "/data/2.5/onecall",
      {
        "appid": apiKeyForMain,
        "lat": lat.toString(),
        "lon": lon.toString(),
        "exclude": "minutely,current",
        "units": "metric",
      },
    );
    try{
      Response response =  await get(uri);
      if(response.statusCode==200){
        // print('hourly: ${response.body}');
        return UniversalResponse(
          data: WeatherModelByOneCall.fromJson(jsonDecode(response.body))
        );
      }
      return UniversalResponse(error: "Error");
    }catch(e){
      return UniversalResponse(error: e.toString());
    }
  }

  Future<UniversalResponse> getWeatherInfoByLonLat(
      {required double lat, required double lon}) async {
    Uri uri = Uri.parse("$baseUrl/data/2.5/weather?appid=$apiKey&lat=$lat&lon=$lon");
    try{
      Response response = await get(uri);
      if(response.statusCode==200){
        return UniversalResponse(
          data: MainWeatherModel.fromJson(jsonDecode(response.body))
        );
      }
      return UniversalResponse(error: "Error");
    }catch(e){
      return UniversalResponse(error: e.toString());
    }
  }

  Future<UniversalResponse> getWeatherInfoByQuery(
      {required String query}) async {
    Uri uri = Uri.parse("$baseUrl/data/2.5/weather?appid=$apiKey&q=$query");
    try{
      Response response = await get(uri);
      if(response.statusCode==200){
        return UniversalResponse(
          data: MainWeatherModel.fromJson(jsonDecode(response.body))
        );
      }
      return UniversalResponse(error: "Error");
    }catch(e){
      return UniversalResponse(error: e.toString());
    }

  }
}
