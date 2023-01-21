import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:insta_furbo/homepage.dart';
import '../Screens/PlayerScreen.dart';
import '../Screens/ScoutScreen.dart';
import 'dart:io';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key, required this.title});

  final String title;

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  late ScrollController _scrollController;
  @override
  void initState() {
    super.initState();

    tabController = new TabController(vsync: this, length: 2, initialIndex: 0);
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

//Widget Foto Input
  Widget imageProfile() {
    return Center(
      child: Stack(children: <Widget>[
        CircleAvatar(
          radius: 80.0,
          backgroundColor: Color.fromARGB(167, 226, 226, 226),
          backgroundImage: AssetImage("assets/profile.jpeg"),
        ),
        Positioned(
          bottom: 20.0,
          right: 20.0,
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: ((builder) => bottomSheet()),
              );
            },
            child: Icon(
              Icons.camera_alt,
              color: Color.fromARGB(255, 54, 131, 57),
              size: 28.0,
            ),
          ),
        ),
      ]),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text(
            "Elige la Foto de Perfil",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
              icon: Icon(
                Icons.camera,
                size: 40,
                color: Colors.grey,
              ),
              onPressed: () {},
              label: Text(
                "Camera",
                style: TextStyle(color: Colors.grey, fontSize: 20),
              ),
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, shadowColor: Colors.white),
              icon: Icon(Icons.image, size: 40, color: Colors.grey),
              onPressed: () {},
              label: Text(
                "Gallery",
                style: TextStyle(color: Colors.grey, fontSize: 20),
              ),
            ),
          ])
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    TabBar tabBar = new TabBar(
      controller: tabController,
      tabs: [
        new Tab(
          text: "JUGADOR",
        ),
        new Tab(
          text: "SCOUT",
        )
      ],
      labelColor: Colors.black,
    );
    TabBarView tabBarView = new TabBarView(
      controller: tabController,
      children: <Widget>[
        new PlayerScreen(),
        new ScoutScreen(),
      ],
    );

    return Scaffold(
        body: Container(
      color: Colors.white,
      child: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(child: imageProfile()),

                // ignore: prefer_const_constructors
                SizedBox(height: 20),
                // ignore: prefer_const_constructors
                Text('Crea Tu Perfil',
                    textAlign: TextAlign.center,
                    // ignore: prefer_const_constructors
                    style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                // ignore: prefer_const_constructors
                SizedBox(
                    height: 40,
                    child: Material(
                      color: Colors.white,
                      child: tabBar,
                    )),
                SizedBox(height: 350, child: tabBarView),
              ],
            ),
          )
        ],
      ),
    ));

    // This trailing comma makes auto-formatting nicer for build methods.);
  }
}
