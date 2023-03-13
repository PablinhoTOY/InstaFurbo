import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:insta_furbo/utils/colors.dart';
import 'package:http/http.dart' as http;

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this, initialIndex: 0);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          PerfilTop(),
          PerfilBottom(),
        ],
      ),
    );
  }

  Widget PerfilBottom() {
    return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      Container(
        color: primaryColor,
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        child: TabBar(
          controller: _tabController,
          isScrollable: true,
          labelStyle: TextStyle(
              fontWeight: FontWeight.w500, fontSize: 14, color: Colors.white),
          indicatorColor: Colors.white,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorWeight: 4,
          tabs: [Tab(text: 'Informacion Deportiva'), Tab(text: 'Media')],
        ),
      ),
      Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: TabBarView(
          controller: _tabController,
          children: [
            FirstScreen(),
            SecondScreen(),
          ],
        ),
      )
    ]);
  }
}

class PerfilTop extends StatelessWidget {
  const PerfilTop({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 3,
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

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height/1.5,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            'It is a contact tab, which is responsible for displaying the contacts stored in your mobile',
            style: TextStyle(
              fontSize: 24.0,
            ),
          ),
        ]));
  }
}

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});
  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  bool loading = false;
  List<String> ids = [];

  @override
  void initState() {
    loading = true;
    ids = [];

    loadImageIds();

    super.initState();
  }

  void loadImageIds() async {
    int random = 0;
    random = Random().nextInt(28) + 1;
    final response = await http
        .get(Uri.parse('https://picsum.photos/v2/list?page=$random&limit=36'));
    final json = jsonDecode(response.body);
    List<String> ids2 = [];
    for (var image in json) {
      ids2.add(image['id']);
    }
    setState(() {
      loading = false;
      ids = ids2;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return 
    Container(
      
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ImagePage(ids[index]),
              ),
            );
          },
          child: Image.network(
            'https://picsum.photos/id/${ids[index]}/300/300',
          ),
        ),
        itemCount: ids.length,
      ),
    );
  }
}

class ImagePage extends StatelessWidget {
  final String id;
  const ImagePage(this.id, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body:
          Center(child: Image.network('https://picsum.photos/id/$id/700/700')),
    );
  }
}

/*@override
Widget build(BuildContext context) {
  return Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'It is a second layout tab, which is responsible for taking pictures from your mobile.',
          style: TextStyle(fontSize: 24.0),
        ),
      ],
    ),
  );
}*/
