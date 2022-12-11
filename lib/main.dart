import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telepay/view/home_screen.dart';
import 'package:telepay/view/login_screen.dart';
import 'package:telepay/view/splash_screen.dart';
import 'package:telepay/view_model/edit_view_model.dart';
import 'package:telepay/view_model/home_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeViewModel(true)),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'TelyPay',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SplashScreen(),
      ),
    );
  }
}

