import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:telepay/view/home_screen.dart';
import 'package:telepay/view_model/login_view_model.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final String appLogo = "assets/images/telypay.png";
  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: ChangeNotifierProvider<LoginViewModel>(
        create: (_)=> LoginViewModel(),

        child: Consumer<LoginViewModel>(
          builder: (context,lvm,child){
            return Form(
              key: lvm.loginForregisterformKey,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(child: Container(
                      height: 230,width: 230,
                      decoration: BoxDecoration(

                          borderRadius: BorderRadius.circular(130),
                          image: DecorationImage(image: AssetImage(appLogo))
                      ),
                    )),
                    const SizedBox(height: 30,),
                    TextFormField(
                      controller: lvm.emailController,
                      // autovalidateMode: widget.autovalidateMode ?? AutovalidateMode.onUserInteraction,
                      style: const TextStyle(color: Colors.black,
                        fontWeight: FontWeight.w300,
                      ),
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 18,horizontal: 15),


                        border:  OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            borderSide: BorderSide(color:Colors.black54)),
                        enabledBorder:  OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          borderSide: BorderSide(color: Colors.black54),
                        ),
                        focusedBorder:  OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          borderSide: BorderSide(color: Colors.black54),
                        ),
                        errorBorder:  OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            borderSide: BorderSide(color: Colors.black54)),
                        focusedErrorBorder:  OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            borderSide: BorderSide(color:Colors.black54)),
                        errorMaxLines: 1,
                        errorStyle: TextStyle(
                            fontSize: 9,
                            fontWeight: FontWeight.w500,

                            color: Colors.black54),
                        hintText:  "E-mail",
                        hintStyle:  TextStyle(
                          color:Colors.black54,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),

                        labelText: "E-Mail",
                        labelStyle: TextStyle(
                            color: Colors.black54,fontSize: 12 ,fontWeight: FontWeight.w500
                        ),
                        isDense: true,                      // Added this
                      ),

                      validator: (String? value) {
                        const String emailRegex = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                        RegExp emailreq =  RegExp(emailRegex);
                        if (value==null||value.isEmpty) {
                          return 'please enter your Email';
                        } else if (!emailreq.hasMatch(value)) {
                          return "Invalid User";
                        } else {
                          return null;
                        }


                      },
                      onChanged: (text) {
                        // if(widget.onChanged!=null){
                        //   widget.onChanged!(text);
                        // }

                      },
                      keyboardType:TextInputType.emailAddress,
                      inputFormatters:[ FilteringTextInputFormatter.deny(
                        RegExp(
                            r'(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])'
                        ),
                      ),],

                      // readOnly: widget.textFormFieldType == TextFormFieldType.dateOfBirth ? true : false,
                    ),
                    const SizedBox(height: 20,),
                    TextFormField(
                      controller: lvm.passwrdcontroller,
                      // autovalidateMode: widget.autovalidateMode ?? AutovalidateMode.onUserInteraction,
                      style: const TextStyle(color: Colors.black,
                        fontWeight: FontWeight.w300,
                      ),
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 18,horizontal: 15),


                        border:  OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            borderSide: BorderSide(color:Colors.black54)),
                        enabledBorder:  OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          borderSide: BorderSide(color: Colors.black54),
                        ),
                        focusedBorder:  OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          borderSide: BorderSide(color: Colors.black54),
                        ),
                        errorBorder:  OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            borderSide: BorderSide(color: Colors.black54)),
                        focusedErrorBorder:  OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            borderSide: BorderSide(color:Colors.black54)),
                        errorMaxLines: 1,
                        errorStyle: TextStyle(
                            fontSize: 9,
                            fontWeight: FontWeight.w500,

                            color: Colors.black54),
                        hintText:  "Password",
                        hintStyle:  TextStyle(
                          color:Colors.black54,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),

                        labelText: "Password",
                        labelStyle: TextStyle(
                            color: Colors.black54,fontSize: 12 ,fontWeight: FontWeight.w500
                        ),
                        isDense: true,                      // Added this
                      ),
                      validator: (String? value) {
                         const String passwordRegex =  r'^(?=.*?[0-9])(?=.*?[!@#\$&*~%]).{6,20}$';
                          RegExp passreq =  RegExp(passwordRegex);
                        if (value==null||value.isEmpty) {
                          return 'please enter your Password';
                        } else if (passreq.hasMatch(value)) {
                          return "Invalid User";
                        } else {
                          return null;
                        }
                      },
                      onChanged: (text) {
                        // if(widget.onChanged!=null){
                        //   widget.onChanged!(text);
                        // }

                      },
                      keyboardType:TextInputType.emailAddress,
                      inputFormatters:[ FilteringTextInputFormatter.deny(
                        RegExp(
                            r'(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])'
                        ),
                      ),],

                      // readOnly: widget.textFormFieldType == TextFormFieldType.dateOfBirth ? true : false,
                    ),
                    const SizedBox(height: 40,),

                    lvm.loading==true ?
                    const CircularProgressIndicator(
                      backgroundColor:  Color(0xFF113d63),
                      color: Color(0xFFfed12c),
                    ):
                    SizedBox(
                      width:  230,
                      height:  55,
                      child: TextButton(
                        style: TextButton.styleFrom(

                            shape:  RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8), // <-- Radius
                            ),
                            backgroundColor: const Color(0xFF113d63)),
                        onPressed: () {
                          if(lvm.emailController.text!=null || lvm.passwrdcontroller.text != null){
                            lvm.login(context);
                          }



                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(

                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFfed12c),),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },

        ),
      ),
    );
  }
}
