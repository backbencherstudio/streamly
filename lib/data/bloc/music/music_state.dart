import 'package:equatable/equatable.dart';

import '../../model/music/music_model.dart';

abstract class MusicState extends Equatable {
  @override
  List<Object?> get props => [];
}

class MusicLoading extends MusicState {}

class MusicLoaded extends MusicState {
  final List<Music> musics;

  MusicLoaded(this.musics);

  @override
  List<Object?> get props => [musics];
}

class MusicError extends MusicState {
  final String message;

  MusicError(this.message);

  @override
  List<Object?> get props => [message];
}