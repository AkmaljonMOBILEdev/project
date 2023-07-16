class WindModel {
  final double speed;
  final int deg;
  final double gust;

  WindModel({required this.speed, required this.deg, required this.gust,});

  factory WindModel.fromJson(Map<String, dynamic> json){
    return WindModel(
      speed: json["speed"] ?? 0,
      deg: json["deg"] ?? 0,
      gust: json["gust"] ?? 0,);
  }
}
