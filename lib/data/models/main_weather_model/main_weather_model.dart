import 'package:e_commerce/data/models/main_weather_model/sys_model.dart';
import 'package:e_commerce/data/models/main_weather_model/weather_model.dart';
import 'package:e_commerce/data/models/main_weather_model/wind_model.dart';

import 'coord_model.dart';
import 'inner_main_model.dart';

class MainWeatherModel {
  final CoordModel coord;
  final List<WeatherModel> weather;
  final String base;
  final InnerMainModel main;
  final int visibility;
  final WindModel wind;
  final int cloudsAll;
  final int dt;
  final SysModel sys;
  final int timezone;
  final int id;
  final String name;
  final int cod;

  MainWeatherModel({
    required this.coord, required this.weather, required this.base, required this.main, required this.visibility,
    required this.wind, required this.cloudsAll, required this.dt, required this.sys, required this.timezone, required this.id,
    required this.name, required this.cod,});
  
  factory MainWeatherModel.fromJson(Map<String, dynamic> json){
    return MainWeatherModel(
        coord: CoordModel.fromJson(json["coord"]),
        weather: (json["weather"] as List)
        .map((e) => WeatherModel.fromJson(e)).toList(),
        base: json["base"] ?? "",
        main: InnerMainModel.fromJson(json["main"]),
        visibility: json["visibility"] ?? 0,
        wind: WindModel.fromJson(json["wind"]),
        cloudsAll: json["clouds"]["all"],
        dt: json["dt"] ?? 0,
        sys: SysModel.fromJson(json["sys"]),
        timezone: json["timezone"] ?? 0,
        id: json["id"] ?? 0,
        name: json["name"] ?? "",
        cod: json["cod"] ?? 0,
    );
  }

}
