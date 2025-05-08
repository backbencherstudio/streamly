part of 'comment_bloc.dart';

abstract class CommentEvent extends Equatable {
  const CommentEvent();
  @override
  List<Object> get props => [];
}

class LoadComments extends CommentEvent {}

class AddComment extends CommentEvent {
  final String text;
  const AddComment(this.text);
  @override
  List<Object> get props => [text];
}

class AddReply extends CommentEvent {
  final String commentId;
  final String text;
  const AddReply(this.commentId, this.text);
  @override
  List<Object> get props => [commentId, text];
}

class LikeComment extends CommentEvent {
  final String commentId;
  const LikeComment(this.commentId);
  @override
  List<Object> get props => [commentId];
}

class DislikeComment extends CommentEvent {
  final String commentId;
  const DislikeComment(this.commentId);
  @override
  List<Object> get props => [commentId];
}
