class DailyWeatherModel {
  final int id;
  final String main;
  final String description;
  final String icon;

  DailyWeatherModel({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  factory DailyWeatherModel.fromJson(Map<String, dynamic> json) {
    return DailyWeatherModel(
      id: json["id"] ?? 0,
      main: json["main"] ?? "",
      description: json["description"] ?? "",
      icon: json["icon"] ?? "",
    );
  }
}
