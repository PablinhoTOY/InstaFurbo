import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:insta_furbo/Resources/storage_methods.dart';
import 'package:insta_furbo/models/user_data.dart' as model;

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
    String res = "Ocurrio un Error";
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

        model.user User = model.user(
          uid: cred.user!.uid,
          name: name,
          lastname: lastname,
          email: email,
          password: password,
          contacts: [],
          userType: UserType,
          photo: photoURl,
        );

        await _firestore.collection('user').doc(cred.user!.uid).set(
              User.toJson(),
            );
        res = "success";
      } else {
        res = "Ingrese Todos los Campos";
      }
    } on FirebaseAuthException catch (err) {
      if (err.code == 'invalid-email') {
        res = 'The mail is badly formated';
      } else if (err.code == 'weak-password') {
        res = 'la contraseña debe tener mas de 6 caracteres';
      } else {
        res = err.toString();
      }
    }
    return res;
  }

//Autenticacion del usuario

  Future<String> loginUser({
    required email,
    required password,
  }) async {
    String res = "Ocurrio un Error";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = "success";
      } else {
        res = "Ingrese Todos los Campos";
      }
    } on FirebaseAuthException catch (err) {
      if (err.code == 'wrong-password') {
        res = "contraseña incorrecta";
      }
    }
    return res;
  }
}
