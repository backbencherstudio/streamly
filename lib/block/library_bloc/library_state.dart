import 'package:equatable/equatable.dart';
import '../../model/movie/category_model.dart';

abstract class LibraryState extends Equatable {
  const LibraryState();

  @override
  List<Object?> get props => [];
}

class LibraryInitial extends LibraryState {}

class LibraryLoading extends LibraryState {}

class LibraryLoaded extends LibraryState {
  final List<Category> categories;
  final String searchQuery;
  final bool showSuggestions;

  // New filter fields
  final String? selectedCategory;
  final String? selectedGenre;
  final DateTime? selectedYear;
  final String? keyword;
  final String? topRated;

  const LibraryLoaded(
      this.categories, {
        this.searchQuery = '',
        this.showSuggestions = false,
        this.selectedCategory,
        this.selectedGenre,
        this.selectedYear,
        this.keyword,
        this.topRated,
      });

  LibraryLoaded copyWith({
    List<Category>? categories,
    String? searchQuery,
    bool? showSuggestions,
    String? selectedCategory,
    String? selectedGenre,
    DateTime? selectedYear,
    String? keyword,
    String? topRated,
  }) {
    return LibraryLoaded(
      categories ?? this.categories,
      searchQuery: searchQuery ?? this.searchQuery,
      showSuggestions: showSuggestions ?? this.showSuggestions,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      selectedGenre: selectedGenre ?? this.selectedGenre,
      selectedYear: selectedYear ?? this.selectedYear,
      keyword: keyword ?? this.keyword,
      topRated: topRated ?? this.topRated,
    );
  }

  @override
  List<Object?> get props => [
    categories,
    searchQuery,
    showSuggestions,
    selectedCategory,
    selectedGenre,
    selectedYear,
    keyword,
    topRated,
  ];
}

class LibraryError extends LibraryState {
  final String message;
  const LibraryError(this.message);

  @override
  List<Object> get props => [message];
}

class FocusSearchFieldState extends LibraryState {
  final bool isFocused;
  const FocusSearchFieldState(this.isFocused);

  @override
  List<Object> get props => [isFocused];
}
