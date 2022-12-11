
import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' as Foundation;
import 'package:telepay/serviece/exception/exception.dart';
import 'package:telepay/serviece/exception/exception_messages.dart';
import 'package:telepay/utility/enum.dart';


class ApiBaseHelperClass {
  static final ApiBaseHelperClass _singleton = ApiBaseHelperClass._internal();

  factory ApiBaseHelperClass() {
    return _singleton;
  }

  ApiBaseHelperClass._internal();

  static BaseOptions baseOptions = BaseOptions(
    baseUrl: getBaseUrl(),
    connectTimeout: 10000,
    receiveTimeout: 10000,
    responseType: ResponseType.json,

  );

  Dio dio = Dio(baseOptions);

  Future<dynamic> getRequest(NetworkType method, String endPoint,[header,queryParams]) async {

    var responseJson;
    try {
      debugPrint("Api--------->${dio.options.baseUrl + endPoint}");
      debugPrint("type--------->${method}");
      if(header != null){
        dio.options.headers.addAll(header);
        debugPrint("headers ========>${dio.options.headers}");
      }
      if(queryParams != null){
        dio.options.queryParameters.addAll(queryParams);
        debugPrint("query params ========>${dio.options.queryParameters}");
      }
      final response = await dio.get(endPoint);
      responseJson = _returnResponse(response);
      debugPrint("Api result after converting-->$responseJson");
    }on DioError catch(exception){
      debugPrint("Exccception ${exception.response?.statusCode} ${exception.type}");
      handleDioExceptions(exception);
    }catch(exception){
      throw exception;
    }
    return responseJson;
  }
  //endregion

  //region Post Methode
  Future<dynamic> postRequest(
      NetworkType method, String endPoint, dynamic params,[header,isMultiPartRequest]) async {
    var responseJson;
    try {
      debugPrint("Api ============>${dio.options.baseUrl + endPoint}");
      debugPrint("type--------->$method");
      debugPrint("params =========>$params");
      ///if header is not null add the header to request
      if(header != null){
        dio.options.headers.addAll(header);
        debugPrint("header =========>${dio.options.headers}");
      }
      if(method == NetworkType.post){
        final response = await dio.post(endPoint,
            data: isMultiPartRequest == null ? jsonEncode(params) : params,
            onReceiveProgress: (int count, int total) {
              //  debugPrint("sent${count.toString()}" + " total${total.toString()}");
            }, onSendProgress: (int count, int total) {
              // debugPrint("sent${count.toString()}" + " total${total.toString()}");
            });
        responseJson = _returnResponse(response);
      }else if(method == NetworkType.delete){
        final response = await dio.delete(endPoint,data: jsonEncode(params));
        responseJson = _returnResponse(response);
      }
      debugPrint("Api result after converting-->$responseJson");
    } on DioError catch(exception){
      debugPrint("Exccception ${exception.response?.statusCode} ${exception.type}");
      handleDioExceptions(exception);
    }catch(exception){
      // throw UnHandledException(exception.toString());
      throw exception;
    }
    return responseJson;
  }
//endregion

  ///handling the exception
  handleDioExceptions(DioError exception){
    switch(exception.type){
      case DioErrorType.receiveTimeout:
      case DioErrorType.connectTimeout:
      case DioErrorType.sendTimeout:
        throw TimeoutException(ExceptionMessages.connectionTimeOut);
    ///handle 500,400,401 api erros .....
      case DioErrorType.response:
        switch(exception.response?.statusCode ?? -1){
          case 400:
            debugPrint("data type of response ${exception.response?.data.runtimeType}");
            throw BadRequestException(exception.response?.data['message'] ?? ExceptionMessages.badRequest);
          case 401:
            // NavigationHelperFn.logout();
            throw UnauthorisedException(ExceptionMessages.unAuthorization);
          case 500:
            throw InternalServerError( ExceptionMessages.internelServerError);
          default:
            throw UnHandledException(exception.message);
        }
      case DioErrorType.other:
        if (exception.message.contains('SocketException')) {
          throw InterNetConnectionException(ExceptionMessages.noInternetConnection);
        }
        break;
    }
  }

  //region Base Url Depends on Modes
  static String getBaseUrl() {
    if (Foundation.kReleaseMode) {
      //todo: change the name of base url
      return  "https://challenge.telypay.net";
    } else if (Foundation.kDebugMode) {
      return "https://challenge.telypay.net";
    } else if (Foundation.kProfileMode) {
      return "https://challenge.telypay.net";
    } else {
      return "https://challenge.telypay.net";
    }
  }
//endregion

  dynamic _returnResponse(Response response) {
    //please refer: https://restfulapi.net/http-status-codes/
    switch (response.statusCode) {
      case 200:
      case 201:
        var responseJson = response.data;
        return responseJson;
      case 405:
        throw BadRequestException(ExceptionMessages.badRequest);
      case 401:
      case 403:
        throw UnauthorisedException(ExceptionMessages.unAuthorization);
      case 408:
      case 504:
        throw ConnectionTimeOutEception(ExceptionMessages.connectionTimeOut);
      case 500:
        throw InternalServerError(ExceptionMessages.internelServerError);
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode :${response.statusCode}');
    }
  }
}

