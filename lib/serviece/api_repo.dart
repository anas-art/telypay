
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:telepay/serviece/api_base_helperclass.dart';

import '../utility/enum.dart';

class ApiRepository{

  ApiBaseHelperClass apiBaseHelperClass = ApiBaseHelperClass();

  login(email,password){
    Map<String,dynamic> params= {
      "email":email,
      "password":password,
    };
    return apiBaseHelperClass.postRequest(NetworkType.post,"/auth/login",params);
  }


  getProductList(){
    return apiBaseHelperClass.getRequest(NetworkType.get,"/product/all");
  }



}