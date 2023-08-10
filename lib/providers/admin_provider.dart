import 'package:e_commerce/data/models/posting_model/data_model/data_model.dart';
import 'package:e_commerce/data/models/posting_model/notification_model/notification_model.dart';
import 'package:e_commerce/data/models/posting_model/posting_model.dart';
import 'package:e_commerce/data/models/universal_response.dart';
import 'package:e_commerce/data/network/api_provider.dart';
import 'package:e_commerce/utils/ui_utils/error_message_dialog.dart';
import 'package:e_commerce/utils/ui_utils/loading_dialog.dart';
import 'package:flutter/cupertino.dart';

class AdminProvider with ChangeNotifier {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  final TextEditingController sourceController = TextEditingController();

  clearParameters() {
    titleController.clear();
    descController.clear();
    sourceController.clear();
  }

  sendNotification(BuildContext context) async {
    showLoading(context: context);
    UniversalData data = await ApiProvider().publishNews(PostingModel(
        to: "/topics/news",
        dataModel: DataModel(
          title: titleController.text,
          description: descController.text,
          imageUrl:
              "https://static.vecteezy.com/system/resources/thumbnails/006/299/370/original/world-breaking-news-digital-earth-hud-rotating-globe-rotating-free-video.jpg",
          source: sourceController.text,
        ),
        notificationModel: NotificationModel(
          title: titleController.text,
          body: titleController.text,
        ),
      ));
    if(context.mounted) hideLoading(context: context);
    if(data.error.isEmpty){
      if(context.mounted){
        Navigator.pop(context);
        showConfirmMessage(message: "Notification is sended!", context: context);
        clearParameters();
      }
    }
  }

}
