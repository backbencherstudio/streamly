class UserModel {
  final String id;
  final String name;
  final String email;
  final String? avatar;
  final String role;
  final String status;
  final String? imageUrl;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.avatar,
    required this.role,
    required this.status,
    this.imageUrl,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      avatar: json['avatar'],
      role: json['role'] ?? '',
      status: json['status'] ?? '',
      imageUrl: json['imageUrl'],
    );
  }
}
