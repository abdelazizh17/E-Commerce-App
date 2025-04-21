class CategoryItem {
  final String name;
  final String imageUrl;

  CategoryItem({
    required this.name,
    required this.imageUrl,
  });

  factory CategoryItem.fromJson(Map<String, dynamic> json) {
    return CategoryItem(
      name: json['name'],
      imageUrl: json['imageUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'imageUrl': imageUrl,
    };
  }
}
