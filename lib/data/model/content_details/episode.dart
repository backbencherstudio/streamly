class Episode {
  final String title;
  final String thumbnailUrl;
  final bool isSelected;

  const Episode({
    required this.title,
    required this.thumbnailUrl,
    this.isSelected = false,
  });

  Episode copyWith({String? title, String? thumbnailUrl, bool? isSelected}) {
    return Episode(
      title: title ?? this.title,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
