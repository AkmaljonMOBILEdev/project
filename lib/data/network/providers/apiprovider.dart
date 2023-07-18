import 'dart:convert';
import 'dart:io';
import 'package:e_commerce/data/models/serper_model/serper_model.dart';
import 'package:e_commerce/data/network/providers/network_utils.dart';
import 'package:e_commerce/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import '../../models/universal_response.dart';

class ApiProvider{
  Future<UniversalData> searchFromGoogle(
        {required String query, required int page, required int count}
      )async{
    Uri uri = Uri.https(
      baseUrl,
      "/search",
      {
        "q":query,
        "page":page.toString(),
        "num":count.toString(),
        "gl":"uz",
        "hl":"en"
      }
    );
    try{
      Response response = await post(uri,headers: {
        "X-API-KEY": apiKey,
        "Content-type":'application/json'
      });
      if(response.statusCode==HttpStatus.ok){
        print("Main data: ${response.body}");
        return UniversalData(
          data: SerperModel.fromJson(jsonDecode(response.body))
        );
      }
        return handleHttpErrors(response);
    }on SocketException {
      return UniversalData(error: "Internet Error!");
    } on FormatException {
      return UniversalData(error: "Format Error!");
    } catch (err) {
      debugPrint("ERROR:$err. ERROR TYPE: ${err.runtimeType}");
      return UniversalData(error: err.toString());
    }

  }
}