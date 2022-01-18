class Topic {
  String id;
  String courseId;
  String name;
  String linkFile;

  Topic({
    required this.id,
    required this.courseId,
    required this.name,
    required this.linkFile
});

  factory Topic.fromJson(Map<String, dynamic> json) {
    return Topic(
        id: json['id'], courseId: json['courseId'], name: json['name'], linkFile: json['nameFile']);
  }
}