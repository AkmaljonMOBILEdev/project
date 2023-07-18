class KnowledgeGraphModel {
  final String title;
  final String type;
  final String imageUrl;
  final String description;

  KnowledgeGraphModel({
    required this.title,
    required this.type,
    required this.imageUrl,
    required this.description,
  });

  factory KnowledgeGraphModel.fromJson(Map<String, dynamic> json) {
    return KnowledgeGraphModel(
      title: json["title"] ?? "No title",
      type: json["type"] ?? "No such type",
      imageUrl: json["imageUrl"] ?? "Not found image",
      description: json["description"] ?? "Description not given",
    );
  }
}
