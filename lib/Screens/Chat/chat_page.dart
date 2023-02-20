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
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Expanded(
            child: ChatInfo(),
          ),
          TextField(
            cursorColor: primaryColor,
            maxLines: null,
            decoration: InputDecoration(
              filled: true,
              fillColor: Color.fromARGB(255, 88, 85, 85),
              hintText: 'Type a message!',
              hintStyle: TextStyle(
                color: Colors.grey,
              ),
              prefixIcon: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: Icon(
                  Icons.sports_soccer,
                  color: Colors.grey,
                ),
              ),
              suffixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Icon(
                      Icons.camera_alt,
                      color: Colors.grey,
                    ),
                    Icon(
                      Icons.attach_file,
                      color: Colors.grey,
                    ),
                    Icon(
                      Icons.money,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
              border: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),
              contentPadding: const EdgeInsets.all(15),
            ),
          ),
        ],
      ),
    );
  }
}
