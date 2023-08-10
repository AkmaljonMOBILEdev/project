import 'dart:convert';

import 'package:e_commerce/data/models/posting_model/posting_model.dart';
import 'package:e_commerce/utils/constants.dart';
import 'package:http/http.dart';
import '../models/universal_response.dart';

class ApiProvider{
  Future<UniversalData> publishNews(PostingModel postingModel)async{
    final headers = {
      "Content-type":"application/json",
      "Authorization":"key=$apiKey"
    };

    final response = await post(
      Uri.parse(sendFcmUrl),
      headers: headers,
      body: jsonEncode(postingModel)
    );

    if(response.statusCode==200){
      return UniversalData(data: "Send successfully!");
    }else{
      return UniversalData(error: "Something went wrong");
    }

  }
}