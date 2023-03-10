import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../homepage.dart';

class WebScreenLayout extends StatelessWidget {
  const WebScreenLayout({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const MyHomePage(),
    );
  }
}
