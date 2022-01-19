import 'dart:convert';

class User {
  String id;
  String email;
  String name;
  String linkAvatar;
  String? phone;
  String birthday;
  String? country;

  User(
      {required this.id,
      required this.email,
      required this.name,
      required this.linkAvatar,
      this.phone,
      required this.birthday,
      this.country});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'],
        email: json['email'],
        name: json['name'],
        linkAvatar: json['avatar'],
        //phone: json['phone'],
        birthday: json['birthday'],
        country: json['country']);
  }

}

