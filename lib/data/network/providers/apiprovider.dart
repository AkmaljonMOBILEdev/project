import 'dart:convert';
import 'dart:io';
import 'package:e_commerce/data/models/universal_response.dart';
import 'package:e_commerce/data/models/user_model/user_model.dart';
import 'package:e_commerce/data/network/network_utils.dart';
import 'package:http/http.dart';

class ApiProvider{
  Future<UniversalData> getAllUsers()async{
    Uri uri = Uri.https("jsonplaceholder.typicode.com/albums");
    try{
      Response response = await get(uri);
      if(response.statusCode==200){
        return UniversalData(
          data: (jsonDecode(response.body)as List<UserModel>?)
              ?.map((e) => UserModel.fromJson(e as Map<String, dynamic>)).toList() ?? []
        );
      }
      return handleHttpErrors(response);
    }on SocketException {
      return UniversalData(error: "Internet Error!");
    } on FormatException {
      return UniversalData(error: "Format Error!");
    }
    catch(e){
      return UniversalData(
        error: e.toString()
      );
    }
  }
}