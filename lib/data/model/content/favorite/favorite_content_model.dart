class FavoriteContentModel {
  final String id;
  final String createdAt;
  final String contentId;
  final String userId;
  final String categoryId;
  final String title;
  final String thumbnail;
  final String description;
  final dynamic rating;
  final Category? category;
  final Content content;

  FavoriteContentModel({
    required this.id,
    required this.createdAt,
    required this.contentId,
    required this.userId,
    required this.categoryId,
    required this.title,
    required this.thumbnail,
    required this.description,
    required this.rating,
    required this.category,
    required this.content,
  });

  factory FavoriteContentModel.fromJson(Map<String, dynamic> json) {
    return FavoriteContentModel(
      id: json['id'] ?? '',
      createdAt: json['created_at'] ?? '',
      contentId: json['content_id'] ?? '',
      userId: json['user_id'] ?? '',
      categoryId: json['category_id'] ?? '',
      title: json['title'] ?? '',
      thumbnail: json['thumbnail'] ?? '',
      description: json['description'] ?? '',
      rating: json['rating'],
      category: json['category'] != null
          ? Category.fromJson(json['category'])
          : null,
      content: Content.fromJson(json['content'] ?? {}),
    );
  }
}

class Content {
  final String id;
  final String title;
  final String description;
  final String thumbnail;

  Content({
    required this.id,
    required this.title,
    required this.description,
    required this.thumbnail,
  });

  factory Content.fromJson(Map<String, dynamic> json) {
    return Content(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      thumbnail: json['thumbnail'] ?? '',
    );
  }
}

class Category {
  final String id;
  final String name;

  Category({
    required this.id,
    required this.name,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
    );
  }
}
