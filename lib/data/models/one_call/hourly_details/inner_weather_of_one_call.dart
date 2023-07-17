class InnerWeatherOfOneCall {
  final int id;
  final String main;
  final String description;
  final String icon;

  InnerWeatherOfOneCall({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  factory InnerWeatherOfOneCall.fromJson(Map<String, dynamic> json) {
    return InnerWeatherOfOneCall(
      id: json["id"] ?? 0,
      main: json["main"] ?? "",
      description: json["description"] ?? "",
      icon: json["icon"] ?? "",
    );
  }
}
