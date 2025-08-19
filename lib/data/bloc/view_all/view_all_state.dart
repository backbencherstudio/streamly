import 'package:equatable/equatable.dart';
import '../../model/music/music_model.dart';

abstract class ViewAllState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ViewAllLoading extends ViewAllState {}

class ViewAllLoaded extends ViewAllState {
  final List<Music> musics;

  ViewAllLoaded(this.musics);

  @override
  List<Object?> get props => [musics];
}

class ViewAllError extends ViewAllState {
  final String message;

  ViewAllError(this.message);

  @override
  List<Object?> get props => [message];
}
