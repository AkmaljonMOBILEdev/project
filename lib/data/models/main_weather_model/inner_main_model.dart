class InnerMainModel {
  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int pressure;
  final int humidity;
  final int seaLevel;
  final int grndLevel;

  InnerMainModel(
      {required this.temp, required this.feelsLike, required this.tempMin, required this.tempMax,
        required this.pressure, required this.humidity, required this.seaLevel, required this.grndLevel,});

  factory InnerMainModel.fromJson(Map<String, dynamic> json){
    return InnerMainModel(
      temp: json["temp"] ?? 0,
      feelsLike: json["feels_like"] ?? 0,
      tempMin: json["temp_min"] ?? 0,
      tempMax: json["temp_max"] ?? 0,
      pressure: json["pressure"] ?? 0,
      humidity: json["humidity"] ?? 0,
      seaLevel: json["sea_level"] ?? 0,
      grndLevel: json["grnd_level"] ?? 0,);
  }
}
