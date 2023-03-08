import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Container(
          child: ListView(
            children: [
              PerfilTop(),
            ],
          ),
        ),
      ),
    );
  }
}

class PerfilTop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height/3.5,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'lib/Assets/img/cancha.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          TabBar(
            tabs: [
              Tab(
                text: 'asd',
              ),
              Tab(text: 'yalabethia')
            ],
            labelColor: Colors.black,
          ),
        ],
      ),
    );
  }
}
