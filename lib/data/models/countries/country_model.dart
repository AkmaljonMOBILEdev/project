import 'package:e_commerce/data/models/countries/continent_model.dart';

class CountryModel {
  final String code;
  final String name;
  final String phone;
  final ContinentModel continentModel;
  final String capital;
  final String currency;
  final String emoji;

  CountryModel({
    required this.code,
    required this.name,
    required this.phone,
    required this.continentModel,
    required this.capital,
    required this.currency,
    required this.emoji,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      code: json["code"] ?? "",
      name: json["name"] ?? "",
      phone: json["phone"] ?? "",
      continentModel: ContinentModel.fromJson(json["continent"]),
      capital: json["capital"] ?? "",
      currency: json["currency"] ?? "",
      emoji: json["emoji"] ?? "",
    );
  }
}
