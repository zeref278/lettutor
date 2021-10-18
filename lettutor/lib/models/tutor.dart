class Tutor {
  String? id;
  String name;
  String? description;
  double? rating;
  String? tag;
  String linkAvatar;
  bool? isActive;

  Tutor({
    this.id = '',
    required this.name,
    this.description,
    this.rating,
    this.tag,
    this.isActive,
    required this.linkAvatar,
  });
}
