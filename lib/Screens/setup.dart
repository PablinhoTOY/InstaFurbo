import 'package:flutter/material.dart';
import 'package:insta_furbo/homepage.dart';
import 'package:insta_furbo/utils/colors.dart';

class SetupScreen extends StatefulWidget {
  State<SetupScreen> createState() => _SetupScreenState();
}

class _SetupScreenState extends State<SetupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        title: const Text('Subir Multimedia'),
        actions: [
          FloatingActionButton.extended(
            label: Text('Subir'), // <-- Text
            backgroundColor: Colors.black,
            icon: Icon(
              // <-- Icon
              Icons.upload,
              size: 14.0,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(''),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: 'Escribe algo...',
                    border: InputBorder.none,
                  ),
                  maxLines: 8,
                ),
              ),
              SizedBox(
                height: 45,
                width: 45,
                child: AspectRatio(
                  aspectRatio: 600 / 400,
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: NetworkImage(
                          'https://www.biografiasyvidas.com/biografia/m/fotos/mozart.jpg'),
                      fit: BoxFit.fill,
                      alignment: FractionalOffset.topCenter,
                    )),
                  ),
                ),
              )
            ],
          )
        ]),
      ),
    );
  }
}
