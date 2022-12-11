import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../model/product_model.dart';
import '../serviece/api_repo.dart';
import '../utility/enum.dart';
bool apicall =true;
class HomeViewModel extends ChangeNotifier{

  List<ProductModel>_product_list = [];
  List<ProductModel>get productList => _product_list;
  ApiRepository apiRepository = ApiRepository();
  bool _isLoading = true;
  bool get loading =>_isLoading;
  List<ProductModel> _searchResult = [];
  List<ProductModel>get searchResult => _searchResult;
  TextEditingController controller =  TextEditingController();
  TextEditingController get search_controller => controller;

  bool isSearchingKeyword = false;

  HomeViewModel(apicall,[list]){
    print("api call >>>>> ${apicall}");
    product(apicall,list);
  }
  product(apicall,list) async {

    try {
      final apiResponse = await apiRepository.getProductList();
      _isLoading = false;
      final jsonresponse = json.encode(apiResponse);
      print(jsonresponse);
      // print(apiResponse);
      List<ProductModel> _model = productModelFromJson(jsonresponse);
      if(apicall == true){
        _product_list = _model;
        notifyListeners();
      }else{
        _product_list = list;
        notifyListeners();
      }

    } catch (e) {
      _isLoading = false;
      notifyListeners();
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor:  Color(0xFF113d63),
          textColor: Color(0xFFfed12c),
          fontSize: 16.0
      );
     print(e.toString());
    }
  }


  onSearchTextChanged(String text) async {
    if(search_controller.text.isNotEmpty){
      print("NOT EMPTYYYYYYYYYYYYYYYYYYYYY");
      isSearchingKeyword = true;
      _searchResult = [];
      notifyListeners();
      String txt = text.toLowerCase();
      _product_list.forEach((productdata) {
        if (productdata.name.toString().toLowerCase().contains(txt) ||
            productdata.price.toString().contains(txt) ||
            productdata.noInStock.toString().contains(txt)) _searchResult.add(
            productdata);
      }
      );
    }
    else if(text=="" || search_controller.text.isEmpty){
      print("EMPTYYYYYYYYYYYYYYYYYYYYY");

      return _product_list;
    }


    }

  removeindex(index,Listtype type){
    if(type == Listtype.searchlist){
      _searchResult.removeAt(index);
      // searchResult.removeAt(index);
      notifyListeners();
    }else if(type == Listtype.productlist){
      productList.removeAt(index);
      // searchResult.removeAt(index);
      notifyListeners();
    }

  }
}