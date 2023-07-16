class CoordModel {
  final double lon;
  final double lat;

  CoordModel({required this.lon, required this.lat});

  factory CoordModel.fromJson(Map<String, dynamic> json) {
    return CoordModel(
      lon: json["lon"] ?? 0,
      lat: json["lat"] ?? 0,
    );
  }
}
