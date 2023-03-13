import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:insta_furbo/utils/global_variables.dart';
import 'package:provider/provider.dart';

import '../Providers/user_provider.dart';

class ReponsiveLayout extends StatefulWidget {
  final Widget webScreenLayout;
  final Widget mobileScreenLayout;

  const ReponsiveLayout(
      {Key? key,
      required this.mobileScreenLayout,
      required this.webScreenLayout})
      : super(key: key);

  @override
  State<ReponsiveLayout> createState() => _ReponsiveLayoutState();
}

class _ReponsiveLayoutState extends State<ReponsiveLayout> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addData();
  }

  addData() async {
    try {
      UserProvider _userProvider = Provider.of(context, listen: false);
      await _userProvider.refreshUser();
    } catch (err) {
      print(err.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > webScreenSize) {
        //web
        return widget.webScreenLayout;
      }
      //mobile
      return widget.mobileScreenLayout;
    });
  }
}
