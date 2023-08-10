import 'package:e_commerce/data/local/storage_repository.dart';
import 'package:e_commerce/providers/notification_provider.dart';
import 'package:e_commerce/ui/admin_screen/admin_screen.dart';
import 'package:e_commerce/ui/home_screen/widgets/news_holder.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  bool isSubscribed = false;

  @override
  void initState() {
    // initFirebase(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blue.withOpacity(.4),
          title: Text("News"),
          actions: [
            TextButton(
                onPressed: () async {
                  setState(() {
                    isSubscribed = !isSubscribed;
                    StorageRepository.putBool("subs", isSubscribed);
                  });
                  StorageRepository.getBool("subs")
                      ? await FirebaseMessaging.instance
                          .subscribeToTopic("news")
                      : await FirebaseMessaging.instance
                          .unsubscribeFromTopic("news");
                },
                child: Text(
                  StorageRepository.getBool("subs") ? "ON" : "OFF",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w700),
                )),
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AdminScreen()));
                },
                icon: Icon(Icons.add)),
            // IconButton(
            //     onPressed: () {
            //       context.read<NewsProvider>().readNews();
            //     },
            //     icon: Icon(Icons.update))
          ],
        ),
        backgroundColor: Colors.blue.withOpacity(.4),
        body: Consumer<NewsProvider>(
          builder: (context, newsProvider, child) {
            newsProvider.readNews();
            return ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              itemCount: newsProvider.news.length,
              separatorBuilder: (context, index) {
                return SizedBox(height: 20,);
              },
              itemBuilder: (context, index) {
                return NewsHolder(newsModel: newsProvider.news[index]);
              },

            );
          },
        ));
  }
}
// ListView.separated(
// physics: BouncingScrollPhysics(),
// padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
// itemCount: context.watch<NewsProvider>().news.length,
// separatorBuilder: (context, index) {
// return SizedBox(height: 20.h);
// },
// itemBuilder: (context, index) {
// return NewsHolder(
// newsModel: context.watch<NewsProvider>().news[index]);
// },
// )
