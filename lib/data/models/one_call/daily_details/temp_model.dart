class TempModel {
  final double day;
  final double min;
  final double max;
  final double night;
  final double eve;
  final double morn;

  TempModel({
    required this.day,
    required this.min,
    required this.max,
    required this.night,
    required this.eve,
    required this.morn,
  });

  factory TempModel.fromJson(Map<String, dynamic> json) {
    return TempModel(
      day: json["day"] ?? 0,
      min: json["min"] ?? 0,
      max: json["max"] ?? 0,
      night: json["night"] ?? 0,
      eve: json["eve"] ?? 0,
      morn: json["morn"] ?? 0,
    );
  }
}
