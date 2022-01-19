import 'package:lettutor/models/topic.dart';
import 'package:lettutor/services/parser_service.dart';

import 'category.dart';

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
  List<Category>? categories;

  static List<String> allCategory = [];

  Course(
      {required this.id,
      required this.name,
      required this.description,
      required this.level,
      required this.courseLength,
      required this.reason,
      required this.purpose,
      required this.linkImageCover,
      this.listTopic,
      this.tutorsId,
      this.tutorsName,
      this.categories});

  factory Course.fromJson(Map<String, dynamic> json) {
    List<Topic> topics = [];
    json['topics'].forEach((v) {
      topics.add(Topic.fromJson(v));
    });

    List<Category> categories = [];
    json['categories'].forEach((v) {
      categories.add(Category.fromJson(v));
    });

    allCategory.addAll(categories.map((e) => e.title));
    allCategory = allCategory.toSet().toList();


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
        categories: categories);
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

