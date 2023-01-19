import 'package:flutter/material.dart';
import 'package:insta_furbo/Screens/chat.dart';
import 'package:insta_furbo/Screens/profile.dart';
import 'package:insta_furbo/Screens/search.dart';
import 'package:insta_furbo/Screens/home.dart';
import 'package:insta_furbo/Screens/setup.dart';


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
      appBar: AppBar(title: Text('UnoFurbo', style: TextStyle(fontSize: 24))),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 6.0,
        clipBehavior: Clip.antiAlias,
        child: Container(
          height: kBottomNavigationBarHeight,
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
                backgroundColor: Colors.black,
                currentIndex: _currentIndex,
                selectedItemColor: Colors.green,
                unselectedItemColor: Colors.white,
        
                onTap: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home',
                    backgroundColor: Colors.black,
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.search),
                    label: 'Buscar',
                    backgroundColor: Colors.black,
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.abc, size: 0,),
                    label: '',
                    backgroundColor: Colors.black,
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.chat),
                    label: 'Chat',
                    backgroundColor: Colors.black,
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: 'Perfil',
                    backgroundColor: Colors.black,
                  ),
                ]),
          ),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: _currentIndex == 2 ? Colors.green[300] : Colors.green,
        child:
            Icon(Icons.sports_soccer_rounded, size: 54.0, color: Colors.black),
        onPressed: () => setState(() {
          _currentIndex = 2;
        }),
      ),
    );
  }
}