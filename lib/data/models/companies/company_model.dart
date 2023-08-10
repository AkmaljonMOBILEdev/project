class CompanyModel {
  final int id;
  final String carModel;
  final num averagePrice;
  final String logo;
  final int year;

  CompanyModel({
    required this.id,
    required this.carModel,
    required this.averagePrice,
    required this.logo,
    required this.year,
  });

  factory CompanyModel.fromJson(Map<String, dynamic> json) {
    return CompanyModel(
      id: json["id"] ?? 0,
      carModel: json["car_model"] ?? "",
      averagePrice: json["average_price"] ?? 0,
      logo: json["logo"] ?? "",
      year: json["established_year"] ?? 0,
    );
  }
}

