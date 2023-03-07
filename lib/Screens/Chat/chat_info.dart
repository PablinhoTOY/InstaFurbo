import 'package:flutter/material.dart';
import 'package:insta_furbo/Screens/Chat/my_card.dart';
import 'package:insta_furbo/Screens/Chat/sender_card.dart';

class ChatInfo extends StatelessWidget {
  const ChatInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int a = 0;
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
          while (a <= 2) {
            a++;
            return MyMessageCard(
              message: 'vaya vaya vaya vaya vaya vaya vaya vaya vaya vaya vaya vaya vaya vaya vaya vaya vaya vaya vaya vaya ',
              //message: messages[index]['text'].toString(),
              date: '6:50 pm',
              //date: messages[index]['time'].toString(),
            );
          }
          return SenderMessageCard(
            message: 'si ha que locura si ha que locura si ha que locura si ha que locura si ha que locura si ha que locura si ha que locura ',
            //message: messages[index]['text'].toString(),
            date: '6:52 pm',
            //date: messages[index]['time'].toString(),
          );
      },
    );
  }
}
