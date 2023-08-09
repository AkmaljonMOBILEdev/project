class NewsModel {
  int? id;
  final String title;
  final String desc;
  final String imageUrl;
  final String source;

  NewsModel({
    this.id,
    required this.title,
    required this.desc,
    required this.imageUrl,
    required this.source,
  });

  NewsModel copyWith({
    int? id,
    String? title,
    String? desc,
    String? imageUrl,
    String? source,
  }) {
    return NewsModel(
      id: id ?? this.id,
      title: title ?? this.title,
      desc: desc ?? this.desc,
      imageUrl: imageUrl ?? this.imageUrl,
      source: source ?? this.source,
    );
  }

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      title: json["title"] ?? "",
      desc: json["desc"] ?? "",
      imageUrl: json["imageUrl"] ?? "",
      source: json["source"] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "desc": desc,
      "imageUrl": imageUrl,
      "source": source,
    };
  }
}
