import 'package:flutter/material.dart';
import 'package:insta_furbo/Screens/chat.dart';
import 'package:insta_furbo/Screens/profile.dart';
import 'package:insta_furbo/Screens/search.dart';
import 'package:insta_furbo/Screens/home.dart';
import 'package:insta_furbo/Screens/setup.dart';
import 'package:insta_furbo/utils/colors.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  List<Widget> _pages = [];
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text('UnoFurbo', style: TextStyle(fontSize: 24)),
        automaticallyImplyLeading: false,
      ),
      body: _pages[_currentIndex],
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
        backgroundColor: _currentIndex == 2 ? Color.fromARGB(255, 71, 182, 75) : primaryColor,
        child:
            Icon(Icons.sports_soccer_rounded, size: 56.0, color: Colors.black),
        onPressed: () => setState(() {
          _currentIndex = 2;
        }),
      ),
    );
  }
}
