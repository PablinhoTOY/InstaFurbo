import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:insta_furbo/Resources/storage_methods.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//Registro Usuario
  Future<String> signUpUser({
    required String email,
    required String password,
    required String name,
    required String lastname,
    required String UserType,
    required Uint8List file,
  }) async {
    String res = "Algun error ocurrio";
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          name.isNotEmpty ||
          lastname.isNotEmpty ||
          UserType.isNotEmpty ||
          file != null) {
        //registrar usuario
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        String photoURl = await StorageMethods()
            .uploadImageToStorage('ProfileImages', file, false);

        //añadir usuario a la base de datos
        await _firestore.collection('user').doc(cred.user!.uid).set({
          'Uid': cred.user!.uid,
          'Username': name,
          'Lastname': lastname,
          'E-mail': email,
          'Password': password,
          'Contacts': [],
          'UserType': UserType,
          'photoUrl': photoURl,
        });
        res = "funcionó! :D";
      }
    } on FirebaseAuthException catch (err) {
      if (err.code == 'invalid-email') {
        res = 'The mail is badly formated';
      } else if (err.code == 'weak-password') {
        res = 'la contraseña debe tener mas de 6 caracteres';
      }

      res = err.toString();
    }
    return res;
  }
}
