import 'package:flutter/material.dart';
import 'package:insta_furbo/Screens/Chat/chat_info.dart';
import 'package:insta_furbo/utils/colors.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Joel "nombre del remitente"'
            //info[0]['name'].toString(),
            ),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.video_call),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.call),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Column(
        children: [
          const Expanded(child: ChatInfo()),
          Container(
            margin: EdgeInsets.all(15.0),
            height: 70,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(35.0),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 3),
                            blurRadius: 5,
                            color: Colors.grey)
                      ],
                    ),
                    child: Row(
                      children: [
                        IconButton(
                            icon: Icon(
                              Icons.face,
                              color: Colors.black,
                            ),
                            onPressed: () {}),
                        Expanded(
                          child: TextField(
                            maxLines: null,
                            cursorColor: primaryColor,
                            decoration: InputDecoration(
                                hintText: "Type Something...",
                                hintStyle: TextStyle(color: Colors.black),
                                border: InputBorder.none),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.photo_camera,
                              color: Colors.black),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon:
                              Icon(Icons.attach_file, color: Colors.black),
                          onPressed: () {},
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 15),
                Container(
                  padding: const EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                      color: Colors.black, shape: BoxShape.circle),
                  child: InkWell(
                    child: Icon(
                      Icons.send,
                
                      color: Colors.white,
                    ),
                    onLongPress: () {},
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}