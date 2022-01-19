import 'package:lettutor/models/user.dart';

class MyFeedback {
  String name;
  String linkAvatar;
  String content;
  double rating;
  String date;

  MyFeedback(
      {required this.content,
      required this.rating,
      required this.date,
      required this.name,
      required this.linkAvatar});

  factory MyFeedback.fromJson(Map<String, dynamic> json) {
    return MyFeedback(
        content: json['content'],
        rating: double.parse(json['rating'].toString()),
        date: json['createdAt'], name: json['firstInfo']['name'], linkAvatar: json['firstInfo']['avatar']);
  }
}
