import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insta_furbo/utils/colors.dart';
import 'package:insta_furbo/utils/utils.dart';

class SetupScreen extends StatefulWidget {
  final String _image;
  //const SetupScreen(this._image);
  const SetupScreen(this._image, {Key? key}) : super(key: key);

  @override
  State<SetupScreen> createState() => _SetupScreenState();
}

class _SetupScreenState extends State<SetupScreen> {
  Uint8List? _file;
  _SelectImage(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: const Text('Create a post'),
            children: [
              SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: Text('Take a Photo'),
                onPressed: () async {
                  Navigator.of(context).pop();
                  Uint8List file = await pickImage(
                    ImageSource.camera,
                  );
                  setState(() {
                    _file = file;
                  });
                },
              ),
              SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: Text('Use Gallery'),
                onPressed: () async {
                  Navigator.of(context).pop();
                  Uint8List file = await pickImage(
                    ImageSource.gallery,
                  );
                  setState(() {
                    _file = file;
                  });
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return _file == null
        ? Scaffold(
            body: Center(
              child: IconButton(
                icon: const Icon(
                  Icons.upload,
                  size: 40,
                ),
                onPressed: () => _SelectImage(context),
              ),
            ),
          )
        : Scaffold(
            appBar: AppBar(
              backgroundColor: primaryColor,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context),
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
                      backgroundImage: NetworkImage(widget._image),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.45,
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
                            image: MemoryImage(_file!),
                            fit: BoxFit.fill,
                            alignment: FractionalOffset.topCenter,
                          )),
                        ),
                      ),
                    ),
                    const Divider(),
                  ],
                )
              ]),
            ),
          );
  }
}
