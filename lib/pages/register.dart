import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:insta_furbo/homepage.dart';
import 'package:insta_furbo/Screens/Parts/PlayerScreen.dart';
import 'package:insta_furbo/Screens/Parts/ScoutScreen.dart';
import 'dart:io';
import 'package:insta_furbo/utils/colors.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({
    super.key,
  });

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
          child: Icon(Icons.person, size: 100, color: Colors.white,),
          backgroundColor: primaryColor,
        ),
        Positioned(
          bottom: 2,
          right: 2,
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: ((builder) => bottomSheet()),
              );
            },
            child: const CircleAvatar(
              radius: 25,
              backgroundColor: Colors.black,
              child: Icon(
                Icons.add_a_photo,
                color: Colors.white,
                size: 25.0,
              ),
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
    TabBar tabBar = TabBar(
      controller: tabController,
      tabs: const [
        Tab(
          text: "JUGADOR",
        ),
        Tab(
          text: "SCOUT",
        )
      ],
      labelColor: Colors.black,
      indicatorWeight: 4.0,
      indicatorColor: primaryColor,
    );
    TabBarView tabBarView = new TabBarView(
      
      physics: const NeverScrollableScrollPhysics( ),
      controller: tabController,
      children: <Widget>[
        new PlayerScreen(),
        new ScoutScreen(),
      ],
    );

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('Registro'),
        ),
        body: Container(
          color: Colors.white,
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0,50,0,0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Center(child: imageProfile()),
                    // ignore: prefer_const_constructors
                    SizedBox(height: 30),
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
                        height: 50,
                        child: Material(
                          color: Colors.white,
                          child: tabBar,
                        )),
                    SizedBox(
                        height: MediaQuery.of(context).size.height,
                        child: tabBarView),
                  ],
                ),
              )
            ],
          ),
        ));

    // This trailing comma makes auto-formatting nicer for build methods.);
  }
}
