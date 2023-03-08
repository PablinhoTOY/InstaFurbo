import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//Registro Usuario
  Future<String> signUpUser({
    required String email,
    required String password,
    required String name,
    required String lastname,
    //required Uint8List file,
  }) async {
    String res = "Algun error ocurrio";
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          name.isNotEmpty ||
          lastname.isNotEmpty) {
        //registrar usuario
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        //añadir usuario a la base de datos
        await _firestore.collection('user').doc(cred.user!.uid).set({
          'Uid': cred.user!.uid,
          'Username': name,
          'Lastname': lastname,
          'E-mail': email,
          'Password': password,
          'Contacts': [],
        });
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
