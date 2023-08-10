import 'package:e_commerce/ui/admin_screen/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/admin_provider.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.withOpacity(.4),
        centerTitle: true,
        title: Text("Admin Screen"),
      ),
      body: WillPopScope(
        onWillPop: ()async{
          context.read<AdminProvider>().clearParameters();
          return true;
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                AdminTextField(
                    hintText: 'Title',
                    controller: context.read<AdminProvider>().titleController),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 300,
                  child: AdminTextField(
                    hintText: 'Description',
                    isDesc: true,
                    controller: context.read<AdminProvider>().descController,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                AdminTextField(
                  hintText: 'Source',
                  controller: context.read<AdminProvider>().sourceController,
                ),
                SizedBox(
                  height: 50,
                ),
                SizedBox(
                  width: 220,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () {
                        context.read<AdminProvider>().sendNotification(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.withOpacity(.4)
                      ),
                      child: Text(
                        "Send",
                        style: TextStyle(fontSize: 25),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
