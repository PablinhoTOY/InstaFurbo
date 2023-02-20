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
        pageTransitionsTheme: pageTransitionsTheme,
        primaryColor: primaryColor,
      ),
      home: const LoginScreen(
    
      ),
    );
  }
}

final pageTransitionsTheme = PageTransitionsTheme(
  builders: <TargetPlatform, PageTransitionsBuilder>{
    TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
    TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
  },
);