import 'package:e_commerce/data/models/serper_model/organic_model/site_link_model.dart';

class OrganicModel {
  final String title;
  final String link;
  final String snippet;
  final String imageUrl;
  // final List<SiteLinkModel> sitelinks;

  OrganicModel(
      {required this.title, required this.link, required this.snippet, required this.imageUrl});

  factory OrganicModel.fromJson(Map<String, dynamic> json){
    return OrganicModel(
        title: json["title"] ?? "",
        link: json["link"],
        snippet: json["snippet"] ?? "",
        imageUrl: json["imageUrl"] ?? "",

    );
  }

}