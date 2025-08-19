import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../core/utils/dummy_data.dart';
import '../../model/comment/comment.dart';

part 'comment_event.dart';
part 'comment_state.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  CommentBloc() : super(CommentInitial()) {
    on<LoadComments>(_onLoadComments);
    on<AddComment>(_onAddComment);
    on<AddReply>(_onAddReply);
    on<LikeComment>(_onLikeComment);
    on<DislikeComment>(_onDislikeComment);
  }


  void _onLoadComments(LoadComments event, Emitter<CommentState> emit) {
    // Emit the dummy comments when the state is loaded
    emit(CommentsLoaded(comments: dummyComments));
  }

  void _onAddComment(AddComment event, Emitter<CommentState> emit) {
    if (state is CommentsLoaded) {
      final current = state as CommentsLoaded;
      final updated = List<Comment>.from(current.comments)
        ..insert(
          0,
          Comment(
            id: DateTime.now().toIso8601String(),
            user: 'You',
            text: event.text,
            time: 'Just now',
            likes: 0,
            dislikes: 0,
            replies: [],
          ),
        );
      emit(CommentsLoaded(comments: updated));
    }
  }

  void _onAddReply(AddReply event, Emitter<CommentState> emit) {
    if (state is CommentsLoaded) {
      final current = state as CommentsLoaded;
      final updated = current.comments.map((c) {
        if (c.id == event.commentId) {
          return c.copyWith(replies: [
            ...c.replies,
            Comment(
              id: DateTime.now().toIso8601String(),
              user: 'You',
              text: event.text,
              time: 'Just now',
              likes: 0,
              dislikes: 0,
              replies: [],
            ),
          ]);
        }
        return c;
      }).toList();
      emit(CommentsLoaded(comments: updated));
    }
  }

  void _onLikeComment(LikeComment event, Emitter<CommentState> emit) {
    if (state is CommentsLoaded) {
      final current = state as CommentsLoaded;
      final updated = current.comments.map((c) {
        if (c.id == event.commentId) {
          return c.copyWith(likes: c.likes + 1);
        }
        return c;
      }).toList();
      emit(CommentsLoaded(comments: updated));
    }
  }

  void _onDislikeComment(DislikeComment event, Emitter<CommentState> emit) {
    if (state is CommentsLoaded) {
      final current = state as CommentsLoaded;
      final updated = current.comments.map((c) {
        if (c.id == event.commentId) {
          return c.copyWith(dislikes: c.dislikes + 1);
        }
        return c;
      }).toList();
      emit(CommentsLoaded(comments: updated));
    }
  }
}
