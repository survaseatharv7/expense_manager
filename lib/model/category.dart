class Category {
  String category;
  String imageUrl;
  Category({required this.category, required this.imageUrl});

  Map<String, dynamic> categoryMap() {
    return {'category': category, 'imageUrl': imageUrl};
  }
}
