class user {
  final String uid;
  final String name;
  final String lastname;
  final String email;
  final String password;
  final String photo;
  final List contacts;
  final String userType;

  const user(
      {required this.uid,
      required this.name,
      required this.lastname,
      required this.email,
      required this.password,
      required this.photo,
      required this.contacts,
      required this.userType});

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "name": name,
        "lastname": lastname,
        "email": email,
        "password": password,
        "photo": photo,
        "contacts": contacts,
        "userType": userType,
      };
}
