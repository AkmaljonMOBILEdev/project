class SiteLinkModel {
  final String title;
  final String link;

  SiteLinkModel({required this.title, required this.link});

  factory SiteLinkModel.fromJson(Map<String, dynamic> json) {
    return SiteLinkModel(
      title: json["title"] ?? "",
      link: json["link"] ?? "",
    );
  }
}
