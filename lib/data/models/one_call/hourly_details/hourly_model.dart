import 'package:e_commerce/data/models/one_call/hourly_details/inner_weather_of_one_call.dart';

class HourlyModel {
  final int dt;
  final double temp;
  final double feelsLike;
  final int pressure;
  final int humidity;
  final int visibility;
  final double windSpeed;
  final List<InnerWeatherOfOneCall> weather;

  HourlyModel({
    required this.dt,
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.visibility,
    required this.windSpeed,
    required this.weather,
  });

  factory HourlyModel.fromJson(Map<String, dynamic> json) {
    return HourlyModel(
        dt: json["dt"] ?? 0,
        temp: json["temp"] ?? 0,
        feelsLike: json["feels_like"] ?? 0,
        pressure: json["pressure"] ?? 0,
        humidity: json["humidity"] ?? 0,
        visibility: json["visibility"] ?? 0,
        windSpeed: json["wind_speed"] ?? 0,
        weather: (json["weather"] as List<dynamic>?)
            ?.map((e) => InnerWeatherOfOneCall.fromJson(e as Map<String, dynamic>))
            .toList() ?? []
    );
  }
}
