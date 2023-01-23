import 'package:flutter/material.dart';
import 'Pages/login.dart';
import 'package:insta_furbo/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'U-BALL',
      theme: ThemeData(
        primaryColor: primaryColor,
      ),
      home: const LoginScreen(
    
      ),
    );
  }
}
