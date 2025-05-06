import 'movie_model.dart';

class Category {
  final String title;
  final List<Movie> movies;

  Category({required this.title, required this.movies});

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    title: json['title'],
    movies: (json['movies'] as List)
        .map((movie) => Movie.fromJson(movie))
        .toList(),
  );
}
