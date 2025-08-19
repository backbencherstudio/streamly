import 'package:equatable/equatable.dart';

abstract class LibraryEvent extends Equatable {
  const LibraryEvent();

  @override
  List<Object> get props => [];
}

class LoadLibrary extends LibraryEvent {}

class SearchQueryChanged extends LibraryEvent {
  final String query;
  const SearchQueryChanged(this.query);

  @override
  List<Object> get props => [query];
}

class FocusSearchField extends LibraryEvent {
  final bool isFocused;
  const FocusSearchField(this.isFocused);

  @override
  List<Object> get props => [isFocused];
}

class CategoryChanged extends LibraryEvent {
  final String category;
  CategoryChanged(this.category);
}

class GenreChanged extends LibraryEvent {
  final String genre;
  GenreChanged(this.genre);
}

class YearChanged extends LibraryEvent {
  final DateTime year;
  YearChanged(this.year);
}

class KeywordChanged extends LibraryEvent {
  final String keyword;
  KeywordChanged(this.keyword);
}

class TopRatedChanged extends LibraryEvent {
  final String topRated;
  TopRatedChanged(this.topRated);
}

class SubmitFilterForm extends LibraryEvent {}

