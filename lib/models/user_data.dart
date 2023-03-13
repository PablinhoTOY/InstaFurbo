import 'package:cloud_firestore/cloud_firestore.dart';

class user {
  final String uid;
  final String name;
  final String lastname;
  final String email;
  final String password;
  final String photo;
  final List contacts;
  final String nickname;
  final String userType;

  const user(
      {required this.uid,
      required this.name,
      required this.lastname,
      required this.email,
      required this.password,
      required this.photo,
      required this.contacts,
      required this.nickname,
      required this.userType});

  static user fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return user(
      uid: snapshot['uid'],
      name: snapshot['name'],
      lastname: snapshot['lastname'],
      email: snapshot['email'],
      password: snapshot['password'],
      photo: snapshot['photo'],
      nickname: snapshot['nickname'],
      contacts: snapshot['contacts'],
      userType: snapshot['userType'],
    );
  }

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "name": name,
        "lastname": lastname,
        "email": email,
        "password": password,
        "photo": photo,
        "nickname": nickname,
        "contacts": contacts,
        "userType": userType,
      };
}
