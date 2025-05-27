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

  Movie copyWith({
    int? id,
    String? title,
    String? posterUrl,
    double? rating,
    String? releaseDate,
  }) {
    return Movie(
      id: id ?? this.id,
      title: title ?? this.title,
      posterUrl: posterUrl ?? this.posterUrl,
      rating: rating ?? this.rating,
      releaseDate: releaseDate ?? this.releaseDate,
    );
  }
}
