import 'package:equatable/equatable.dart';

abstract class MusicEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadMusicEvent extends MusicEvent {}