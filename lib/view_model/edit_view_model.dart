import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:telepay/view/home_screen.dart';
import 'package:telepay/view_model/home_view_model.dart';

import '../model/product_model.dart';
import '../serviece/api_repo.dart';
import '../utility/enum.dart';

class EditViewModel extends ChangeNotifier {
 int? index ;

  late final TextEditingController _namecontroller;
  late final TextEditingController _pricecontroller;
  late final TextEditingController _stockcontroller;

  TextEditingController get namecontroller => _namecontroller;
  TextEditingController get pricecontroller => _pricecontroller;
  TextEditingController get stockcontroller => _stockcontroller;
  String? nme;
  double? pr;
  int? st;
  EditViewModel(name, price, stock ,ind) {
    nme = name;
    pr = price;
    st = stock;
    index = ind;
   print("INDExx ${index}");
    notifyListeners();
    _namecontroller = TextEditingController(text: nme);
    _pricecontroller = TextEditingController(text: pr.toString());
    _stockcontroller = TextEditingController(text: st.toString());

  }

  editdatas(BuildContext context,ProductModel productModel) {

    final abc= Provider.of<HomeViewModel>(context, listen: false);
   abc.productList[index!] = productModel;

   final list = context.read<HomeViewModel>().productList;
    notifyListeners();

    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => HomeScreen(apicall: false,list: list)));
  }
}
