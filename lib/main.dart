import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:insta_furbo/firebase_options.dart';
import 'package:insta_furbo/pages/_login.dart';
import 'package:insta_furbo/pages/welcomepage.dart';

import 'package:insta_furbo/utils/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        scaffoldBackgroundColor: secundaryColor,
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: primaryColor)),
        ),
      ),
      home: WelcomePage(),
    );
  }
}

final pageTransitionsTheme = PageTransitionsTheme(
  builders: <TargetPlatform, PageTransitionsBuilder>{
    TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
    TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
  },
);
