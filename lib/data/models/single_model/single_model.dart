class SingleModel {
  final int id;
  final String carModel;
  final String logo;
  final int year;
  final num averagePrice;
  final String desc;
  final List<String> pics;

  SingleModel({
    required this.id,
    required this.carModel,
    required this.logo,
    required this.year,
    required this.averagePrice,
    required this.desc,
    required this.pics,
  });

  factory SingleModel.fromJson(Map<String, dynamic> json) {
    return SingleModel(
      id: json["id"] ?? 0,
      carModel: json["car_model"] ?? "",
      logo: json["logo"] ?? "",
      year: json["established_year"] ?? 0,
      averagePrice: json["average_price"] ?? 0,
      desc: json["description"] ?? "",
      pics: List<String>.from(json['car_pics'] ?? []),
    );
  }
}
// {
// "id": 5,
// "car_model": "Honda",
// "logo": "https://www.carlogos.org/car-logos/honda-logo-1700x1150.png",
// "established_year": 1949,
// "average_price": 450000,
// "description": "At Honda, The Power of Dreams drives us to create intelligent products that enhance mobility and increase the joy in people’s lives. We continue to draw inspiration from the visionary ideas of our namesake, Soichiro Honda. He saw incredible power in the freedom of mobility and used his imagination to change the world. It is this mindset that guides us to help move people forward and protect the future we all share. We strive to earn the trust and support of the many diverse communities we happily serve, and we’ll always remember who’s in the driver’s seat on the way to a better world for all",
// "car_pics": [
// "https://c8.alamy.com/comp/CMX09G/honda-civic-car-on-display-at-the-33th-bangkok-international-motor-CMX09G.jpg",
// "https://di-uploads-pod14.dealerinspire.com/hondaeastcincy/uploads/2019/11/2019-Honda-Civic-Sedan-in-Cincinnati-OH.jpg",
// "https://img.autobytel.com/2020/honda/civic-type-r/2-800-oemexteriorfront1300-93821.JPG",
// "https://cdn.carbuzz.com/gallery-images/840x560/970000/700/970786.jpg",
// "https://upload.wikimedia.org/wikipedia/commons/thumb/1/19/Honda_Civic_Type_R_FK2_White_Edition.jpg/2560px-Honda_Civic_Type_R_FK2_White_Edition.jpg",
// "https://i.pinimg.com/736x/07/c0/4e/07c04e6a2ea7fbeed8cded8558848b6f.jpg",
// "https://www.tcr-series.com/images/news/2020/2020_TCR_photo_news_468.jpg",
// "https://www.carpixel.net/w/e3c3e34502b8eb64a621a0e3ebf709e7/honda-civic-type-r-wallpaper-hd-98000.jpg",
// "https://www.goodcarbadcar.net/wp-content/uploads/2021/08/New-Honda-Civic-Type-R.jpg"
// ]
// }
