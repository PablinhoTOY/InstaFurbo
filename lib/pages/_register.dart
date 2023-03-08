import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insta_furbo/Resources/auth_methods.dart';
import 'package:insta_furbo/pages/_login.dart';

import '../utils/colors.dart';
import '../utils/utils.dart';

class registerScreen extends StatefulWidget {
  @override
  _registerScreen createState() => _registerScreen();
}

class _registerScreen extends State<registerScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

//Declaracion de controles
  TextEditingController name = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  String Usertype = "";
  Uint8List? _image;

//widgets---------------------------------------------
  Widget imageProfile() {
    return Center(
      child: Stack(children: <Widget>[
        _image != null
            ? CircleAvatar(
                radius: 80,
                backgroundImage: MemoryImage(_image!),
              )
            : const CircleAvatar(
                radius: 80.0,
                backgroundImage: NetworkImage(
                    'https://static.vecteezy.com/system/resources/thumbnails/002/534/006/small/social-media-chatting-online-blank-profile-picture-head-and-body-icon-people-standing-icon-grey-background-free-vector.jpg'),
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

  void selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
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
              onPressed: () {
                selectImage();
              },
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
    // TODO: implement build
    return Scaffold(
        body: Container(
      color: Colors.black,
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Opacity(
              opacity: 0.2,
              child: Image.asset(
                'lib/Assets/img/background_1.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                // give the tab bar a height [can change hheight to preferred height]
                Container(
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(
                      25.0,
                    ),
                  ),
                  child: TabBar(
                    controller: _tabController,
                    // give the indicator a decoration (color and border radius)
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        25.0,
                      ),
                      color: Colors.green,
                    ),
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.black,
                    tabs: [
                      // first tab [you can add an icon using the icon property]
                      Tab(
                        text: 'Jugador',
                      ),

                      // second tab [you can add an icon using the icon property]
                      Tab(
                        text: 'Scout',
                      ),
                    ],
                  ),
                ),
                // tab bar view here
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      // FORMULARIO DEL JUGADOR
                      ListView(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 60),
                            child: Center(
                              child: imageProfile(),
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(right: 16),
                                child: Icon(
                                  Icons.alternate_email,
                                  color: Colors.white,
                                ),
                              ),
                              Expanded(
                                child: TextField(
                                  controller: email,
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 255, 255, 255)),
                                  decoration: InputDecoration(
                                      hintText: 'E-mail',
                                      hintStyle: TextStyle(
                                          color: Color.fromARGB(
                                              255, 184, 184, 184))),
                                ),
                              )
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(right: 16),
                                child: Icon(
                                  Icons.person,
                                  color: Colors.white,
                                ),
                              ),
                              Expanded(
                                child: TextField(
                                  controller: name,
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 255, 255, 255)),
                                  decoration: InputDecoration(
                                      hintText: 'nombre',
                                      hintStyle: TextStyle(
                                          color: Color.fromARGB(
                                              255, 184, 184, 184))),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: TextField(
                                  controller: lastname,
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 255, 255, 255)),
                                  decoration: InputDecoration(
                                      hintText: 'apellido',
                                      hintStyle: TextStyle(
                                          color: Color.fromARGB(
                                              255, 184, 184, 184))),
                                ),
                              )
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(right: 16),
                                child: Icon(
                                  Icons.lock,
                                  color: Colors.white,
                                ),
                              ),
                              Expanded(
                                child: TextField(
                                  controller: password,
                                  obscureText: true,
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 255, 255, 255)),
                                  decoration: InputDecoration(
                                      hintText: 'Password',
                                      hintStyle: TextStyle(
                                          color: Color.fromARGB(
                                              255, 184, 184, 184))),
                                ),
                              )
                            ],
                          ),
                          //botones

                          Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () => Navigator.pop(context,
                                      MaterialPageRoute(builder: (context) {
                                    return userLogin();
                                  })),
                                  child: Container(
                                    padding: EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: Color.fromARGB(
                                                    255, 255, 255, 255)
                                                .withOpacity(.5))),
                                    child: Icon(
                                      Icons.arrow_back,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    Usertype = "Player";
                                    String res = await AuthMethods().signUpUser(
                                        email: email.text,
                                        password: password.text,
                                        name: name.text,
                                        lastname: lastname.text,
                                        UserType: Usertype
                                        // file: file
                                        );
                                    print(res);
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                            colors: [
                                              Colors.green,
                                              Color.fromARGB(255, 1, 119, 20)
                                            ],
                                            begin: FractionalOffset.topLeft,
                                            end: FractionalOffset.bottomRight),
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color:
                                                Colors.green.withOpacity(.5))),
                                    child: Icon(
                                      Icons.arrow_forward,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      // FORMULARIO DEL SCOUT

                      ListView(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 60),
                            child: Center(
                              child: imageProfile(),
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(right: 16),
                                child: Icon(
                                  Icons.alternate_email,
                                  color: Colors.white,
                                ),
                              ),
                              Expanded(
                                child: TextField(
                                  controller: email,
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 255, 255, 255)),
                                  decoration: InputDecoration(
                                      hintText: 'E-mail',
                                      hintStyle: TextStyle(
                                          color: Color.fromARGB(
                                              255, 184, 184, 184))),
                                ),
                              )
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(right: 16),
                                child: Icon(
                                  Icons.person,
                                  color: Colors.white,
                                ),
                              ),
                              Expanded(
                                child: TextField(
                                  controller: name,
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 255, 255, 255)),
                                  decoration: InputDecoration(
                                      hintText: 'nombre',
                                      hintStyle: TextStyle(
                                          color: Color.fromARGB(
                                              255, 184, 184, 184))),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: TextField(
                                  controller: lastname,
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 255, 255, 255)),
                                  decoration: InputDecoration(
                                      hintText: 'apellido',
                                      hintStyle: TextStyle(
                                          color: Color.fromARGB(
                                              255, 184, 184, 184))),
                                ),
                              )
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(right: 16),
                                child: Icon(
                                  Icons.lock,
                                  color: Colors.white,
                                ),
                              ),
                              Expanded(
                                child: TextField(
                                  controller: password,
                                  obscureText: true,
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 255, 255, 255)),
                                  decoration: InputDecoration(
                                      hintText: 'Password',
                                      hintStyle: TextStyle(
                                          color: Color.fromARGB(
                                              255, 184, 184, 184))),
                                ),
                              )
                            ],
                          ),
                          //botones
                          Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () => Navigator.pop(context,
                                      MaterialPageRoute(builder: (context) {
                                    return userLogin();
                                  })),
                                  child: Container(
                                    padding: EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: Color.fromARGB(
                                                    255, 255, 255, 255)
                                                .withOpacity(.5))),
                                    child: Icon(
                                      Icons.arrow_back,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    Usertype = "Scout";
                                    String res = await AuthMethods().signUpUser(
                                        email: email.text,
                                        password: password.text,
                                        name: name.text,
                                        lastname: lastname.text,
                                        UserType: Usertype
                                        // file: file
                                        );
                                    print(res);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (builder) => userLogin()));
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                            colors: [
                                              Colors.green,
                                              Color.fromARGB(255, 1, 119, 20)
                                            ],
                                            begin: FractionalOffset.topLeft,
                                            end: FractionalOffset.bottomRight),
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color:
                                                Colors.green.withOpacity(.5))),
                                    child: Icon(
                                      Icons.arrow_forward,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
