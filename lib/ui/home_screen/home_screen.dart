import 'package:e_commerce/data/local/storage_repository.dart';
import 'package:e_commerce/data/models/serper_model/knowledge_graph_model/knowledge_graph_model.dart';
import 'package:e_commerce/data/models/serper_model/organic_model/organic_model.dart';
import 'package:e_commerce/data/models/serper_model/serper_model.dart';
import 'package:e_commerce/data/models/universal_response.dart';
import 'package:e_commerce/data/network/providers/apiprovider.dart';
import 'package:e_commerce/utils/colors.dart';
import 'package:e_commerce/utils/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController queryController = TextEditingController();
  ScrollController scrollController = ScrollController();
  FocusNode focusNode = FocusNode();
  bool isLoading = false;
  int currentPage=1;
  int countOfPage=5;
  String queryText='';
  List<OrganicModel> organics = [];
  KnowledgeGraphModel? knowledge;
  List<String> lastSearchedWords=[];

  _fetchData()async{
    setState(() {
      isLoading=true;
    });
    UniversalData universalData =
        await ApiProvider().searchFromGoogle(query: queryText, page: currentPage, count: countOfPage);
    if(queryText.isNotEmpty){
      if(!lastSearchedWords.contains(queryText)){
        lastSearchedWords.insert(0, queryText);
      }else{
        _fetchData();
      }
    }
    if(lastSearchedWords.length==5){
      lastSearchedWords.removeLast();
    }

    await StorageRepository.putList("search", lastSearchedWords);
    setState(() {
      isLoading=false;
    });

    if(universalData.error.isEmpty){
      SerperModel serperModel = universalData.data as SerperModel;
      organics.addAll(serperModel.organic);
      setState(() {

      });
    }
    currentPage++;
  }


  @override
  void initState() {

    scrollController.addListener(() {
      if(scrollController.position.pixels == scrollController.position.maxScrollExtent){
       _fetchData();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    lastSearchedWords = StorageRepository.getList("search");
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: TextField(
          focusNode: focusNode,
          onChanged: (v){
            queryText=v;
          },
          onSubmitted: (v){
            setState(() {
              organics=[];
              currentPage=1;
            });
            _fetchData();
          },
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: AppColors.c2B2B2B
          ),
          controller: queryController,
          decoration: InputDecoration(
            prefixIcon: Padding(
              padding:  EdgeInsets.only(left: 12.w, right: 8.w),
              child: SvgPicture.asset(AppIcons.search,width: 24.w,height: 24.h),
            ),
            hintText: "Search",
            hintStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: AppColors.c999999
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100.r),
              borderSide: BorderSide(
                color: AppColors.cEBEBEB,
                width: 1.w
              )
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(100.r),
                borderSide: BorderSide(
                    color: AppColors.c2B2B2B,
                    width: 1.w
                )
            )
          ),
        ),
        actions: [
          GestureDetector(
              onTap: (){},
              child: SvgPicture.asset(AppIcons.rightIcon,width: 50.w,height: 50.h,))
        ],
        elevation: 1,
      ),
      body: Column(
        children: [
          lastSearchedWords.isNotEmpty?SizedBox(
            height: 60.h,
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 10.h),
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: lastSearchedWords.length,
              separatorBuilder: (BuildContext context, int index){
                return SizedBox(width: 20.w,);
              },
              itemBuilder: (BuildContext context, int index){
                return  Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  decoration: BoxDecoration(
                    color: index==0?Colors.blueAccent.shade400:Colors.transparent,
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(
                        color: Colors.blueAccent,
                        width: 1.w
                    ),
                  ),
                  child: Center(child: TextButton(
                    onPressed: (){
                      setState(() {
                        organics=[];
                        queryText=lastSearchedWords[index];
                        queryController.text=lastSearchedWords[index];
                        _fetchData();
                      });
                    },
                    child: Text(lastSearchedWords[index],
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          letterSpacing: .7,
                          color: index==0?AppColors.white:AppColors.c2B2B2B
                      ),),
                  ),),
                );

              },

            ),
          ):const SizedBox(),
          Expanded(
            child: ListView(
              controller: scrollController,
              physics: const BouncingScrollPhysics(),
              children:[
                ...List.generate(organics.length, (index){
                OrganicModel organic = organics[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                 Container(
                      padding: EdgeInsets.all(16.w),
                      margin: EdgeInsets.all(16.w),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32.r),
                        // boxShadow:  [
                        //   BoxShadow(
                        //     blurRadius: 0,
                        //     spreadRadius: 0,
                        //     color: AppColors.c999999.withOpacity(.2),
                        //     offset: Offset(4, 10)
                        //   )
                        // ],
                        border: Border.all(
                          color: Colors.blueAccent,
                          width: 1.w
                        )
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            organic.imageUrl.isNotEmpty?ClipRRect(
                            borderRadius: BorderRadius.circular(32.r),
                            child: SizedBox(
                                width: 320.w,
                                height: 100.h,
                                child: Image.network(organic.imageUrl,fit: BoxFit.contain,))
                          ):const SizedBox(),
                          Text(organic.title, style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.w600, color: AppColors.c2B2B2B
                          ),),
                          Text(organic.snippet, style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: AppColors.c999999
                          ),),
                          SizedBox(height: 8.h,),
                          Text(organic.link, style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontWeight: FontWeight.w600, color: Colors.blueAccent
                          ),),
                        ],
                      ),
                    ),
                  ],
                );
              }),
                Visibility(
                    visible: isLoading,
                    child: const Center(child: CircularProgressIndicator(),))

              ]
            ),
          ),
        ],
      ),
    );
  }
}
