import 'package:e_commerce/data/models/posting_model/notification_model/notification_model.dart';

import 'data_model/data_model.dart';

class PostingModel {
  final String to;
  final NotificationModel notificationModel;
  final DataModel dataModel;

  PostingModel({
    required this.to,
    required this.dataModel,
    required this.notificationModel,
  });

  factory PostingModel.fromJson(Map<String, dynamic> json) {
    return PostingModel(
      to: json["to"] ?? "",
      dataModel: DataModel.fromJson(json["data"]),
      notificationModel: NotificationModel.fromJson(json["notification"]),
    );
  }

  Map<String, dynamic> toJson(){
    return {
      "to": to,
      "notification":notificationModel.toJson(),
      "data":dataModel.toJson()
    };
  }

}
