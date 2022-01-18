import 'package:lettutor/models/topic.dart';
import 'package:lettutor/services/parser_service.dart';

class Course {
  String id;
  String name;
  String description;
  String level;
  int courseLength;
  String reason;
  String purpose;
  String linkImageCover;
  List<Topic>? listTopic;
  List<String>? tutorsId;
  List<String>? tutorsName;

  Course({
    required this.id,
    required this.name,
    required this.description,
    required this.level,
    required this.courseLength,
    required this.reason,
    required this.purpose,
    required this.linkImageCover,
    this.listTopic,
    this.tutorsId,
    this.tutorsName
});

  factory Course.fromJson(Map<String, dynamic> json) {

    List<Topic> topics = [];
      json['topics'].forEach((v) {
        topics.add(Topic.fromJson(v));
      });


    return Course(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        level: json['level'],
        courseLength: topics.length,
        reason: json['reason'],
        purpose: json['purpose'],
        linkImageCover: json['imageUrl'],
        listTopic: topics

    );
  }

  factory Course.fromJsonVer2(Map<String, dynamic> json) {

    List<Topic> topics = [];
    json['topics'].forEach((v) {
      topics.add(Topic.fromJson(v));
    });

    List<String> tutorsId = [];
    List<String> tutorsName = [];
    json['users'].forEach((v) {
      tutorsId.add(v['id']);
      tutorsName.add(v['name']);
    });



    return Course(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        level: json['level'],
        courseLength: topics.length,
        reason: json['reason'],
        purpose: json['purpose'],
        linkImageCover: json['imageUrl'],
        listTopic: topics,
        tutorsId: tutorsId,
        tutorsName: tutorsName,
    );
  }


}