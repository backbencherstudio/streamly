import 'package:equatable/equatable.dart';

class Comment extends Equatable {
  final String id;
  final String user;
  final String text;
  final String time;
  final int likes;
  final int dislikes;
  final List<Comment> replies;

  const Comment({
    required this.id,
    required this.user,
    required this.text,
    required this.time,
    required this.likes,
    required this.dislikes,
    required this.replies,
  });

  Comment copyWith({
    String? id,
    String? user,
    String? text,
    String? time,
    int? likes,
    int? dislikes,
    List<Comment>? replies,
  }) {
    return Comment(
      id: id ?? this.id,
      user: user ?? this.user,
      text: text ?? this.text,
      time: time ?? this.time,
      likes: likes ?? this.likes,
      dislikes: dislikes ?? this.dislikes,
      replies: replies ?? this.replies,
    );
  }

  @override
  List<Object?> get props => [id, user, text, time, likes, dislikes, replies];
}
