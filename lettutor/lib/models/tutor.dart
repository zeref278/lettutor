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


  Tutor({
    required this.id,
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
    required this.isFavorite
  });

  factory Tutor.fromJson(Map<String, dynamic> json) {
    return Tutor(
      id: json['userId'],
      name: json['User']['name'],
      linkAvatar: json['User']['avatar'],
      specialities: ParserService.parseString(json['specialties'], ","),
      bio: json['bio'],
      isActivated: json['isActivated'] as bool,
      rating: json['avgRating'] as double,
      isFavorite: json['isFavorite'] as bool,
      experience: json['experience'],
      languages: ParserService.parseString(json['languages'], ","),
      interests: json['interests'],
      videoLink: json['video']
    );
  }
}
