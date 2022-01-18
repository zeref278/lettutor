import 'package:lettutor/models/topic.dart';

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

  Course({
    required this.id,
    required this.name,
    required this.description,
    required this.level,
    required this.courseLength,
    required this.reason,
    required this.purpose,
    required this.linkImageCover,
    this.listTopic
});

}