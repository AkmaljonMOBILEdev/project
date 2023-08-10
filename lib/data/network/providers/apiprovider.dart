import 'package:dio/dio.dart';
import 'package:e_commerce/data/models/companies/company_model.dart';
import 'package:e_commerce/data/models/countries/country_model.dart';
import 'package:e_commerce/data/models/single_model/single_model.dart';
import 'package:e_commerce/utils/constants.dart';
import 'package:flutter/cupertino.dart';

import '../../models/universal_response.dart';

class ApiProvider {
  final dio = Dio(BaseOptions(
      baseUrl:baseUrl,
      connectTimeout: Duration(seconds: TimeoutConstants.connectTimeout),
      receiveTimeout: Duration(seconds: TimeoutConstants.receiveTimeout),
      sendTimeout: Duration(seconds: TimeoutConstants.sendTimeout)));
  ApiProvider() {
    _init();
  }
  _init() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onError: (error, handler) async {
          //error.response.statusCode
          debugPrint("ERRORGA KIRDI:${error.message} and ${error.response}");
          return handler.next(error);
        },
        onRequest: (requestOptions, handler) async {
          debugPrint("SO'ROV  YUBORILDI :${handler.isCompleted}");
          // return handler.resolve(Response(requestOptions: requestOptions, data: {"name": "ali", "age": 26}));
          return handler.next(requestOptions);
        },
        onResponse: (response, handler) async {
          debugPrint("JAVOB  KELDI :${handler.isCompleted}");
          return handler.next(response);
        },
      ),
    );
  }

  Future<UniversalData> getAllCountries() async {
    try {
      Response response = await dio.get('/countries');
      if (response.statusCode == 200) {
        debugPrint("IF Successfully: ${response.data["data"]["countries"]}");
        return UniversalData(
          data: (response.data["data"]["countries"] as List?)?.map((e){
            return CountryModel.fromJson(e);
          }).toList() ?? [],
        );
      }
      return UniversalData(error: "Other errors");
    }on DioException catch(e){
      return UniversalData(error: e.error.toString());
    }
    catch (e) {
      return UniversalData(error: e.toString());
    }
  }

  Future<UniversalData> getAllCompanies()async{
    try{
      Response response = await dio.get("/companies");
      if(response.statusCode==200){
        return UniversalData(
          data: (response.data["data"] as List?)
              ?.map((e) => CompanyModel.fromJson(e)).toList() ?? []
        );
      }
      return UniversalData(error: "Other error");
    }on DioException catch(e){
      return UniversalData(error: e.error.toString());
    }catch(e){
      return UniversalData(error: e.toString());
    }

  }
  
  Future<UniversalData> getSingleCompanyById({required int id})async{
    try{
      Response response = await dio.get('/companies/$id');
      if(response.statusCode==200){
        return UniversalData(data: SingleModel.fromJson(response.data));
      }
      return UniversalData(error: "Other error");
    }on DioException catch(e){
      return UniversalData(error: e.error.toString());
    }catch(e){
      return UniversalData(error: e.toString());
    }
  }
}
