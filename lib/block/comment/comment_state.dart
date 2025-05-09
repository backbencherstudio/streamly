part of 'comment_bloc.dart';


abstract class CommentState extends Equatable {
  const CommentState();
  @override
  List<Object?> get props => [];
}

class CommentInitial extends CommentState {}

class CommentsLoaded extends CommentState {
  final List<Comment> comments;

  const CommentsLoaded({required this.comments});

  @override
  List<Object?> get props => [comments];
}
