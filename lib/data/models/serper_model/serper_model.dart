import 'package:e_commerce/data/models/serper_model/knowledge_graph_model/knowledge_graph_model.dart';
import 'organic_model/organic_model.dart';

class SerperModel {
  // final KnowledgeGraphModel knowledgeGraph;
  final List<OrganicModel> organic;

  SerperModel({

    required this.organic,
  });

  factory SerperModel.fromJson(Map<String, dynamic> json) {
    return SerperModel(
      // knowledgeGraph: KnowledgeGraphModel.fromJson(json["knowledgeGraph"]),
      organic: (json["organic"] as List?)
              ?.map((e) => OrganicModel.fromJson(e))
              .toList() ??
          [],
    );
  }
}
