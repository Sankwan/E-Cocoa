import 'package:ecocoa/screens/authentication/login_page.dart';
import 'package:ecocoa/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
Future main() async {

  await Future.delayed(const Duration(seconds: 5));
  FlutterNativeSplash.remove();

runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: const LoginPage(),
    );
  }
}

