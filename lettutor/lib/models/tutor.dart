import 'package:lettutor/models/feedback.dart';
import 'package:lettutor/services/parser_service.dart';

class Tutor {
  String id;
  String name;
  String bio;
  String linkAvatar;
  String? videoLink;
  double rating;
  String? experience;
  String? interests;
  List<String> languages;
  List<String> specialities;
  bool isActivated;
  bool isFavorite;
  List<String>? courseIdAndName;
  List<MyFeedback>? feedbacks;

  Tutor(
      {required this.id,
      required this.name,
      required this.bio,
      required this.linkAvatar,
      this.videoLink,
      required this.rating,
      this.experience,
      this.interests,
      required this.languages,
      required this.specialities,
      required this.isActivated,
      required this.isFavorite,
      this.courseIdAndName,
      this.feedbacks});

  factory Tutor.fromJson(Map<String, dynamic> json) {
    List<String> listCourse = [];
    if (json['User']['courses'] != null) {
      json['User']['courses'].forEach((v) {
        listCourse.add(v['id'] + ',' + v['name']);
      });
    }

    List<MyFeedback> listFeedback = [];
    if (json['User']['feedbacks'] != null) {
      json['User']['feedbacks'].forEach((v) {
        listFeedback.add(MyFeedback.fromJson(v));
      });
    }

    listFeedback.sort((first, seconde) => DateTime.parse(first.date).isAfter(DateTime.parse(seconde.date))? 0:1 );

    return Tutor(
      id: json['userId'],
      name: json['User']['name'],
      linkAvatar: json['User']['avatar'],
      specialities: ParserService.parseString(json['specialties'], ","),
      bio: json['bio'],
      isActivated: json['isActivated'] as bool,
      rating: double.parse(json['avgRating'].toString()),
      isFavorite: json['isFavorite'] as bool,
      experience: json['experience'],
      languages: ParserService.parseString(json['languages'], ","),
      interests: json['interests'],
      videoLink: json['video'],
      courseIdAndName: listCourse,
      feedbacks: listFeedback
    );
  }

  factory Tutor.fromJsonVer2(Map<String, dynamic> json) {
    return Tutor(
      id: json['userId'],
      name: json['name'],
      linkAvatar: json['avatar'],
      specialities: ParserService.parseString(json['specialties'], ","),
      bio: json['bio'],
      isActivated: json['isActivated'] as bool,
      rating: 0,
      isFavorite: false,
      experience: json['experience'],
      languages: ParserService.parseString(json['languages'], ","),
      interests: json['interests'],
      videoLink: json['video'],
    );
  }
}
