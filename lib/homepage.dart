import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:insta_furbo/Providers/user_provider.dart';
import 'package:insta_furbo/Screens/chat.dart';
import 'package:insta_furbo/Screens/profile.dart';
import 'package:insta_furbo/Screens/search.dart';
import 'package:insta_furbo/Screens/home.dart';
import 'package:insta_furbo/Screens/setup.dart';
import 'package:insta_furbo/models/user_data.dart' as model;
import 'package:insta_furbo/utils/colors.dart';
import 'package:provider/provider.dart';
import 'package:insta_furbo/pages/uploadMedia.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  List<Widget> _pages = [];
  bool appbarPin = true;

  @override
  void initState() {
    _pages.add(HomeScreen());
    _pages.add(SearchScreen());
    _pages.add(SetupScreen());
    _pages.add(ChatScreen());
    _pages.add(ProfileScreen());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String _name = "";
    String _email = "";

    if (_currentIndex != 4) {
      appbarPin = true;
    } else {
      appbarPin = false;
    }

    try {
      model.user user = Provider.of<UserProvider>(context).getUser;
      _name = user.name;
      _email = user.email;
    } catch (err) {
      print(err.toString());
    }

    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                backgroundColor: primaryColor,
                automaticallyImplyLeading: false,
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: InkWell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(),
                      ),
                      onTap: () => Scaffold.of(context).openDrawer(),
                    ),
                  ),
                ],
                title: Text('Uno-furbo'),
                pinned: appbarPin,
                floating: true,
                forceElevated: innerBoxIsScrolled,
              )
            ];
          },
          body: _pages[_currentIndex],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: primaryColor,
              ),
              accountEmail: Text(_email,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 0, 0))),
              accountName:
                  Text(_name, style: TextStyle(fontWeight: FontWeight.bold)),
              currentAccountPicture: Stack(
                children: <Widget>[
                  CircleAvatar(
                    radius: 80,
                    backgroundImage: NetworkImage(''),
                  )
                ],
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.home,
              ),
              title: const Text('Pagina 1'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.train,
              ),
              title: const Text('Pagina 2'),
              onTap: () {},
            ),
            const AboutListTile(
              icon: Icon(
                Icons.info,
              ),
              applicationIcon: Icon(
                Icons.local_play,
              ),
              applicationName: 'Uno-Furbo',
              applicationLegalese: '© 2023 Macintosh Inc',
              applicationVersion: '1.0.1',
              aboutBoxChildren: [Text('\nJolel es gei xd')],
              child: Text('Sobre esta aplicacion'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 6.0,
        clipBehavior: Clip.antiAlias,
        child: Container(
          height: 62.5,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(
                  color: Colors.grey,
                  width: 0.5,
                ),
              ),
            ),
            child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                iconSize: 28,
                selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
                backgroundColor: Colors.black,
                currentIndex: _currentIndex,
                selectedItemColor: primaryColor,
                unselectedItemColor: Colors.white,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                onTap: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: '',
                    backgroundColor: Colors.black,
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.search),
                    label: '',
                    backgroundColor: Colors.black,
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.abc,
                      size: 0,
                    ),
                    label: '',
                    backgroundColor: Colors.black,
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.chat),
                    label: '',
                    backgroundColor: Colors.black,
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: '',
                    backgroundColor: Colors.black,
                  ),
                ]),
          ),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: _currentIndex == 2
            ? Color.fromARGB(255, 71, 182, 75)
            : primaryColor,
        child: Icon(Icons.sports_soccer_rounded,
            size: 56.0, color: Color.fromARGB(255, 255, 255, 255)),
        onPressed: () => {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => UploadMedia()))
        },
      ),
    );
  }
}
