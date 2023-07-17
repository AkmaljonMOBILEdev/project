class FeelsLikeModel {
  final double day;
  final double night;
  final double eve;
  final double morn;

  FeelsLikeModel({
    required this.day,
    required this.night,
    required this.eve,
    required this.morn,
  });

  factory FeelsLikeModel.fromJson(Map<String, dynamic> json) {
    return FeelsLikeModel(
      day: json["day"] ?? 0,
      night: json["night"] ?? 0,
      eve: json["eve"] ?? 0,
      morn: json["morn"] ?? 0,
    );
  }
}
