class SysModel {
  final String country;
  final int sunrise;
  final int sunset;

  SysModel(
      {required this.country, required this.sunrise, required this.sunset });

  factory SysModel.fromJson(Map<String, dynamic> json){
    return SysModel(
      country: json["country"] ?? "",
      sunrise: json["sunrise"] ?? 0,
      sunset: json["sunset"] ?? 0,);
  }
}
