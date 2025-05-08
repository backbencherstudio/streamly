import '../../model/content/content_model.dart';

abstract class ContentEvent {}

class LoadContentEvent extends ContentEvent {
  final bool isEpisode;
  LoadContentEvent({required this.isEpisode});
}

class ChangeVideoEvent extends ContentEvent {
  final ContentItem selectedItem;
  ChangeVideoEvent({required this.selectedItem});
}
