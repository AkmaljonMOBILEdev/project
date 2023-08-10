import 'package:e_commerce/providers/basic_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';


class CompanyScreen extends StatelessWidget {
  const CompanyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var companies = Provider.of<BasicProvider>(context).companies;
    return Scaffold(
      appBar: AppBar(
        title: Text("Companies"),
      ),
      body: ListView(
        children: List.generate(companies.length, (index){
          return ListTile(
            title: Text(companies[index].carModel),
            subtitle: Text("${companies[index].year} year"),
            leading: SizedBox(
                width: 50.w,
                height: 50.h,
                child: Image.network(companies[index].logo,)),
            trailing: Text("\$ ${companies[index].averagePrice}"),
          );
        }),
      ),
    );
  }
}
