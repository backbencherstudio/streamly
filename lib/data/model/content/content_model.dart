class ContentItem {
  final String id;
  final String title;
  final String videoUrl;
  final String thumbnailUrl;
  final String contentType;

  ContentItem({
    required this.id,
    required this.title,
    required this.videoUrl,
    required this.thumbnailUrl,
    required this.contentType,
  });

  factory ContentItem.fromJson(Map<String, dynamic> json) {
    return ContentItem(
      id: json['id'],
      title: json['title'],
      videoUrl: json['videoUrl'],
      thumbnailUrl: json['thumbnailUrl'],
      contentType : json['contentType'],
    );
  }
}
