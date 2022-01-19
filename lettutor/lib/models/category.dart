class Category {
  String id;
  String title;
  String key;

  Category({
    required this.id,
    required this.title,
    required this.key,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
        id: json['id'], title: json['title'], key: json['key']);
  }
}