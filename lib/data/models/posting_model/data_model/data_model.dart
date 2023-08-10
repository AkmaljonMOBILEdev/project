class DataModel {
  int? id;
  final String title;
  final String description;
  final String imageUrl;
  final String source;

  DataModel({
    this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.source,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      id: json["id"] ?? 0,
      title: json["title"] ?? "",
      description: json["description"] ?? "",
      imageUrl: json["imageUrl"] ?? "",
      source: json["source"] ?? "",
    );
  }

  Map<String, dynamic> toJson(){
    return {
      "id":id,
      "title":title,
      "description":description,
      "imageUrl":imageUrl,
      "source":source
    };
  }
}
