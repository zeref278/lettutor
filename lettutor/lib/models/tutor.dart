class Tutor {
  String? id;
  String name;
  String description;
  double? rating;
  String specialities;
  String linkAvatar;
  bool? isActive;

  Tutor({
    this.id = '',
    required this.name,
    required this.description,
    this.rating,
    required this.specialities,
    this.isActive,
    required this.linkAvatar,
  });
}
