

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../model/product_model.dart';
import '../serviece/api_repo.dart';
import '../view/home_screen.dart';

class LoginViewModel extends ChangeNotifier {
  final GlobalKey<FormState> _userRegistrarionformKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey();

  GlobalKey<FormState> get loginForregisterformKey => _userRegistrarionformKey;

  GlobalKey get scaffoldkey => _scaffoldKey;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwrdcontroller = TextEditingController();

  TextEditingController get emailController => _emailController;

  TextEditingController get passwrdcontroller => _passwrdcontroller;
  ApiRepository apiRepository = ApiRepository();
  bool? _isLoading ;

  bool? get loading => _isLoading;

  login(context) async {
    _isLoading=true;
    if (_userRegistrarionformKey.currentState!.validate()) {
      try {
        final apiResponse = await apiRepository.login(_emailController.text,_passwrdcontroller.text);
        // print(apiResponse);
        _isLoading=false;

        UserModel userModel = UserModel.fromJson(apiResponse);


        Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
             HomeScreen(apicall: true)
            )
        );
        Fluttertoast.showToast(
            msg: userModel.message.toString(),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor:  Color(0xFF113d63),
            textColor: Color(0xFFfed12c),
            fontSize: 16.0
        );
        _isLoading = false;
        notifyListeners();
      } catch (e) {
        Fluttertoast.showToast(
            msg: e.toString(),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor:  Color(0xFF113d63),
            textColor: Color(0xFFfed12c),
            fontSize: 16.0
        );
      }
    }
  }
}