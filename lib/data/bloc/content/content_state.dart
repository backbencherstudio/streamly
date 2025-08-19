import '../../model/content/content_model.dart';

abstract class ContentState {}

class ContentInitial extends ContentState {}

class ContentLoading extends ContentState {}

class ContentLoaded extends ContentState {
  final List<ContentItem> items;
  final ContentItem selectedItem;

  ContentLoaded({required this.items, required this.selectedItem});
}

class ContentError extends ContentState {
  final String message;
  ContentError({required this.message});
}
