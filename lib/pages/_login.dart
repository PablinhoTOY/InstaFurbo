import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insta_furbo/pages/welcomepage.dart';
import 'package:insta_furbo/utils/colors.dart';

import '_register.dart';

class userLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Stack(children: <Widget>[
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
            padding: const EdgeInsets.all(14.0),
            child: Expanded(
                child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'INICIO DE SESIÓN',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return registerScreen();
                      })),
                      child: Container(
                        child: Text(
                          'REGISTRO',
                          style: TextStyle(
                              color: primaryColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                ),
                Spacer(),
                Icon(
                  Icons.sports_soccer,
                  size: 100,
                  color: Colors.white,
                ),
                Spacer(),
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
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255)),
                        decoration: InputDecoration(
                            hintText: 'E-mail',
                            hintStyle: TextStyle(
                                color: Color.fromARGB(255, 184, 184, 184))),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 50,
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
                        obscureText: true,
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255)),
                        decoration: InputDecoration(
                            hintText: '******',
                            hintStyle: TextStyle(
                                color: Color.fromARGB(255, 184, 184, 184))),
                      ),
                    )
                  ],
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () => Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return WelcomePage();
                        })),
                        child: Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: Color.fromARGB(255, 255, 255, 255)
                                      .withOpacity(.5))),
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
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
                                color: Colors.green.withOpacity(.5))),
                        child: Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )),
          )
        ]),
      ),
    );
  }
}
