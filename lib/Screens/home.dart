import 'package:flutter/material.dart';
import 'package:insta_furbo/utils/colors.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 1,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Container(
              // boundary needed for web
              decoration: BoxDecoration(
                border: Border.symmetric(
                  horizontal: BorderSide(color: Colors.black)
                ),
                color: Colors.white,
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 10,
              ),
              child: Column(
                children: [
                  // HEADER SECTION OF THE POST
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 16,
                    ).copyWith(right: 0),
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 18,
                          backgroundImage: NetworkImage(
                              'https://i.imgur.com/jeoaplb.jpg'),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 8,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  '"Nombre de la persona"',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            showDialog(
                              useRootNavigator: false,
                              context: context,
                              builder: (context) {
                                return Dialog(
                                  child: ListView(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 16),
                                      shrinkWrap: true,
                                      children: [
                                        'Delete',
                                      ]
                                          .map(
                                            (e) => InkWell(
                                                child: Container(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      vertical: 12,
                                                      horizontal: 16),
                                                  child: Text(e),
                                                ),
                                                onTap: () {
                                                  // remove the dialog box
                                                  Navigator.of(context).pop();
                                                }),
                                          )
                                          .toList()),
                                );
                              },
                            );
                          },
                          icon: const Icon(Icons.more_vert),
                        )
                      ],
                    ),
                  ),
                  // IMAGE SECTION OF THE POST
                  GestureDetector(
                    onDoubleTap: () {},
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.40,
                          width: double.infinity,
                          child: Image.network(
                            'https://img.freepik.com/foto-gratis/jugadores-futbol-accion-estadio-profesional_654080-1194.jpg?w=2000',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // LIKE, COMMENT SECTION OF THE POST
                  Row(
                    children: <Widget>[
                      IconButton(
                          icon: const Icon(
                            Icons.comment_outlined,
                          ),
                          onPressed: () {}),
                      IconButton(
                          icon: const Icon(
                            Icons.send,
                          ),
                          onPressed: () {}),
                      Expanded(
                          child: Align(
                        alignment: Alignment.bottomRight,
                        child: IconButton(
                            icon: const Icon(Icons.bookmark_border),
                            onPressed: () {}),
                      ))
                    ],
                  ),
                  //DESCRIPTION AND NUMBER OF COMMENTS
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        DefaultTextStyle(
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2!
                                .copyWith(fontWeight: FontWeight.w800),
                            child: Text(
                              '"Cantidad de likes"',
                              style: Theme.of(context).textTheme.bodyText2,
                            )),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.only(
                            top: 8,
                          ),
                          child: RichText(
                            text: TextSpan(
                              style: const TextStyle(color: Colors.black),
                              children: [
                                TextSpan(
                                  text: '',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: '"Descripcion del post"',
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                            child: Container(
                              child: const Text(
                                'Ver los comentarios',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 6),
                            ),
                            onTap: () => {}),
                        Container(
                          child: Text(
                            '"Hace cuanto tiempo"',
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 4),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
