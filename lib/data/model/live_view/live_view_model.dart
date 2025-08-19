class LiveViewModel {
  final String userName;
  final String userImage;
  final String viewers;
  final List<LiveComment> comments;
  final String streamUrl;

  LiveViewModel({
    required this.userName,
    required this.userImage,
    required this.viewers,
    required this.comments,
    required this.streamUrl,
  });
}

class LiveComment {
  final String name;
  final String message;

  LiveComment({required this.name, required this.message});
}
