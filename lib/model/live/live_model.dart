class LiveUser {
  final int id;
  final String name;
  final String followers;
  final String views;
  final String image;

  LiveUser({
    required this.id,
    required this.name,
    required this.followers,
    required this.views,
    required this.image,
  });

  factory LiveUser.fromJson(Map<String, dynamic> json) {
    return LiveUser(
      id: json['id'],
      name: json['name'],
      followers: json['followers'],
      views: json['views'],
      image: json['image'],
    );
  }
}
