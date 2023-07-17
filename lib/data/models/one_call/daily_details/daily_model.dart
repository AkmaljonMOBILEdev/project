import 'package:e_commerce/data/models/one_call/daily_details/daily_weather_model.dart';
import 'package:e_commerce/data/models/one_call/daily_details/feels_like_model.dart';
import 'package:e_commerce/data/models/one_call/daily_details/temp_model.dart';

class DailyModel {
  final int dt;
  final int sunrise;
  final int sunset;
  final int moonrise;
  final int moonset;
  final TempModel temp;
  final FeelsLikeModel feelsLike;
  final int pressure;
  final int humidity;
  final double windSpeed;
  final List<DailyWeatherModel> weather;

  DailyModel({
    required this.dt,
    required this.sunrise,
    required this.sunset,
    required this.moonrise,
    required this.moonset,
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.windSpeed,
    required this.weather,
  });

  factory DailyModel.fromJson(Map<String, dynamic> json) {
    return DailyModel(
      dt: json["dt"] ?? 0,
      sunrise: json["sunrise"] ?? 0,
      sunset: json["sunset"] ?? 0,
      moonrise: json["moonrise"] ?? 0,
      moonset: json["moonset"] ?? 0,
      temp: TempModel.fromJson(json["temp"]),
      feelsLike: FeelsLikeModel.fromJson(json["feels_like"]),
      pressure: json["pressure"] ?? 0,
      humidity: json["humidity"] ?? 0,
      windSpeed: json["wind_speed"] ?? 0,
      weather: (json["weather"] as List<dynamic>?)
              ?.map(
                  (e) => DailyWeatherModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }
}
