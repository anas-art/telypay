
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telepay/view/login_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final String appLogo = "assets/images/telypay.png";

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                const LoginPage()
            )
        )
    );
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      color: Colors.white,
        child: Center(child: Container(
          height: 260,width: 260,
            decoration: BoxDecoration(

              borderRadius: BorderRadius.circular(130),
              image: DecorationImage(image: AssetImage(appLogo))
            ),
            )));
  }
}

