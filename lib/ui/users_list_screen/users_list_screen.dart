import 'package:e_commerce/data/status/form_status.dart';
import 'package:e_commerce/ui/app_provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UsersListScreen extends StatelessWidget {
  const UsersListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users"),
      ),
      body: Consumer<UserProvider>(builder: (context, userProvider, child){
        switch(userProvider.status){
          case FormStatus.pure:
            return const Text("No data yet",style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: Colors.purpleAccent),);
          case FormStatus.loading:
            return const Center(child: CircularProgressIndicator(),);
          case FormStatus.success:
            return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int index){
              return ListTile(
                title: Text(userProvider.users[index].title),
                subtitle: Text(userProvider.users[index].userId.toString()),
              );
            });
          case FormStatus.failure:
            return Text(userProvider.errorText);

        }
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          UserProvider userProvider = Provider.of<UserProvider>(context, listen: false);
          userProvider.fetAllUsers();
          print("Status: ${userProvider.status}");
        },
        backgroundColor: Colors.purpleAccent,
        child: Icon(Icons.download),
      ),
    );
  }
}
