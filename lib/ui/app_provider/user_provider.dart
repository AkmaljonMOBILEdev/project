import 'package:e_commerce/data/models/universal_response.dart';
import 'package:e_commerce/data/network/providers/apiprovider.dart';
import 'package:e_commerce/data/status/form_status.dart';
import 'package:flutter/cupertino.dart';
import '../../data/models/user_model/user_model.dart';

class UserProvider with ChangeNotifier{
  List<UserModel> users = [];
  FormStatus status = FormStatus.pure;
  String errorText = "";
  fetAllUsers()async{
    notify(FormStatus.loading);
    UniversalData universalData = await ApiProvider().getAllUsers();
    if(universalData.error.isEmpty){
      notify(FormStatus.success);
      users = universalData.data as List<UserModel>;
    }else{
      errorText = universalData.error;
      notify(FormStatus.failure);
    }
  }

  notify(FormStatus value){
    status=value;
    notifyListeners();
  }

}