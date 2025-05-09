import 'package:equatable/equatable.dart';
import '../../model/movie/category_model.dart';

abstract class LibraryState extends Equatable {
  const LibraryState();

  @override
  List<Object> get props => [];
}

class LibraryInitial extends LibraryState {}

class LibraryLoading extends LibraryState {}

class LibraryLoaded extends LibraryState {
  final List<Category> categories;
  final String searchQuery;
  final bool showSuggestions;

  const LibraryLoaded(
      this.categories, {
        this.searchQuery = '',
        this.showSuggestions = false,
      });

  LibraryLoaded copyWith({
    List<Category>? categories,
    String? searchQuery,
    bool? showSuggestions,
  }) {
    return LibraryLoaded(
      categories ?? this.categories,
      searchQuery: searchQuery ?? this.searchQuery,
      showSuggestions: showSuggestions ?? this.showSuggestions,
    );
  }

  @override
  List<Object> get props => [categories, searchQuery, showSuggestions];
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
