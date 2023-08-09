import 'package:e_commerce/data/db/data_base.dart';
import 'package:e_commerce/ui/home_screen/widgets/news_holder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/models/news_model.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  List<NewsModel> news = [];

  getNews()async{
    news = await LocalDatabase.getAllNews();
  }
  @override
  void initState() {
    getNews();
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
            IconButton(onPressed: (){
              setState(() {
                getNews();
              });
            }, icon: Icon(Icons.update))
          ],
        ),
        backgroundColor: Colors.blue.withOpacity(.4),
        body: ListView.separated(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
          itemCount: news.length,
          separatorBuilder: (context, index) {
            return SizedBox(height: 20.h);
          },
          itemBuilder: (context, index){
            return NewsHolder(newsModel: news[index]);
          },

        ));
  }
}
