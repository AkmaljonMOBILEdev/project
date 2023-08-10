import 'package:e_commerce/data/db/data_base.dart';
import 'package:e_commerce/data/global_fields.dart';
import 'package:e_commerce/data/models/news_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'lns.dart';

Future<void> initFirebase() async {
  await Firebase.initializeApp();
  String? fcmToken = await FirebaseMessaging.instance.getToken();
  debugPrint("FCM USER TOKEN: $fcmToken");
  // await FirebaseMessaging.instance.subscribeToTopic("news");

  // FOREGROUND MESSAGE HANDLING.
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    LocalNotificationService.instance.showFlutterNotification(message);
    debugPrint(
        "NOTIFICATION FOREGROUND MODE: ${message.data["imageUrl"]} va ${message.notification!.title} in foreground");
    title = message.data["title"];
    desc = message.data["description"];
    imageUrl = message.data["imageUrl"];
    source = message.data["source"];

    LocalDatabase.insertNews(NewsModel(title: title, desc: desc, imageUrl: imageUrl, source: source));
    // context.read<NewsProvider>().readNews();

  });

  // BACkGROUND MESSAGE HANDLING
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  // FROM TERMINATED MODE

  handleMessage(RemoteMessage message) {
    debugPrint(
        "NOTIFICATION FROM TERMINATED MODE: ${message.data["news_image"]} va ${message.notification!.title} in terminated");
    LocalNotificationService.instance.showFlutterNotification(message);
  }

  RemoteMessage? remoteMessage = await FirebaseMessaging.instance.getInitialMessage();

  if (remoteMessage != null) {
    handleMessage(remoteMessage);
    LocalDatabase.insertNews(NewsModel.fromJson(remoteMessage.data));
    // if(context.mounted) context.read<NewsProvider>().readNews();
  }

  FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  LocalDatabase.insertNews(NewsModel.fromJson(message.data));
  debugPrint(
      "NOTIFICATION BACKGROUND MODE: ${message.data["news_image"]} va ${message.notification!.title} in background");
}



