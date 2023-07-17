import 'daily_details/daily_model.dart';
import 'hourly_details/hourly_model.dart';

class WeatherModelByOneCall {
  final double lat;
  final double lon;
  final String timezone;
  final int timezoneOffset;
  final List<HourlyModel> hourly;
  final List<DailyModel> daily;

  WeatherModelByOneCall({
    required this.lat,
    required this.lon,
    required this.timezone,
    required this.timezoneOffset,
    required this.hourly,
    required this.daily,
  });

  factory WeatherModelByOneCall.fromJson(Map<String, dynamic> json) {
    return WeatherModelByOneCall(
      lat: json["lat"] ?? 0,
      lon: json["lon"] ?? 0,
      timezone: json["timezone"] ?? "",
      timezoneOffset: json["timezoneOffset"] ?? 0,
      hourly: (json["hourly"] as List<dynamic>?)
              ?.map((e) => HourlyModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      daily: (json["daily"] as List<dynamic>?)
              ?.map((e) => DailyModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }
}
