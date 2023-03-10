import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insta_furbo/homepage.dart';

class MobileScreenLayout extends StatelessWidget {
  const MobileScreenLayout({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: const MyHomePage(),
      ),
    );
  }
}
