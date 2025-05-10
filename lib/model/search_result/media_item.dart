class MediaItem {
  final int id;
  final String title;
  final String posterUrl;

  MediaItem({required this.id, required this.title, required this.posterUrl});
}

class MediaCategory {
  final String title;
  final List<MediaItem> items;

  MediaCategory({required this.title, required this.items});
}
