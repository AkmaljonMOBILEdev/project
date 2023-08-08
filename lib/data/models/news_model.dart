class NewsModel {
  final String title;
  final String desc;
  final String imageUrl;
  final String time;
  final String source;

  NewsModel({
    required this.title,
    required this.desc,
    required this.imageUrl,
    required this.time,
    required this.source,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      title: json["title"] ?? "",
      desc: json["desc"] ?? "",
      imageUrl: json["imageUrl"] ?? "",
      time: json["time"] ?? "",
      source: json["source"] ?? "",
    );
  }
}
