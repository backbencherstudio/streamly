class Trailer {
  final String title;
  final String duration;
  final String thumbnailUrl;
  final bool isSelected;

  const Trailer({
    required this.title,
    required this.duration,
    required this.thumbnailUrl,
    this.isSelected = false,
  });

  Trailer copyWith({String? title, String? duration, String? thumbnailUrl, bool? isSelected}) {
    return Trailer(
      title: title ?? this.title,
      duration: duration ?? this.duration,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}