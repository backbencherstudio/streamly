class Music {
  final String id;
  final String title;
  final String videoUrl;
  final String thumbnailUrl;

  Music({required this.id, required this.title, required this.videoUrl, required this.thumbnailUrl});

  factory Music.fromJson(Map<String, dynamic> json) {
    return Music(
      id: json['id'],
      title: json['title'],
      videoUrl: json['videoUrl'],
      thumbnailUrl: json['thumbnailUrl'],
    );
  }
}
