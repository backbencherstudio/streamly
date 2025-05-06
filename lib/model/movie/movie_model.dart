class Movie {
  final int id;
  final String title;
  final String posterUrl;
  final double? rating;
  final String releaseDate;

  Movie({
    required this.id,
    required this.title,
    required this.posterUrl,
    this.rating,
    required this.releaseDate,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
    id: json['id'],
    title: json['title'],
    posterUrl: json['posterUrl'],
    rating: json['rating']?.toDouble(),
    releaseDate: json['releaseDate'],
  );
}
