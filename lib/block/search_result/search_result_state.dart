// state.dart
import '../../model/search_result/media_item.dart';

abstract class SearchResultState {}

class SearchResultLoading extends SearchResultState {}

class SearchResultLoaded extends SearchResultState {
  final List<MediaCategory> categories;
  SearchResultLoaded(this.categories);
}
