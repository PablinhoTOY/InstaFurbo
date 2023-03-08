import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:insta_furbo/utils/colors.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: ListView(
          children: [
            PerfilTop(),
            PerfilBottom(),
          ],
        ),
      ),
    );
  }
}

class PerfilTop extends StatelessWidget {
  const PerfilTop({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 3.5,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('lib/Assets/img/canchita.png'),
            fit: BoxFit.cover),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          CircleAvatar(
            radius: 60,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 55,
              foregroundImage: NetworkImage('https://i.imgur.com/jeoaplb.jpg'),
            ),
          ),
          Text('"Nombre panacota"',
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
          Text('Scout',
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold))
        ],
      ),
    );
  }
}

class PerfilBottom extends StatelessWidget {
  const PerfilBottom({super.key});
  @override
  Widget build(BuildContext context) {
    return const Material(
      color: primaryColor,
      child:  TabBar(
        labelStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 14, color: Colors.white),
        indicatorColor: Colors.white,
        indicatorSize: TabBarIndicatorSize.label,
        indicatorWeight: 4,
        tabs: [
          Tab(text: 'Informacion Deportiva'),
          Tab(text: 'Media')
        ],
      ),
    );
  }
}
