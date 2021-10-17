class Tutor {
  String name;
  String? description;
  double? rating;
  String? tag;
  String linkAvatar;

  Tutor({
    required this.name,
    this.description,
    this.rating,
    this.tag,
    required this.linkAvatar,
  });
}
