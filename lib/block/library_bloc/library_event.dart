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
