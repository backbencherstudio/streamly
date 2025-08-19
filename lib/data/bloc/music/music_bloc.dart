import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/music/music_model.dart';
import 'music_event.dart';
import 'music_state.dart';

class MusicBloc extends Bloc<MusicEvent, MusicState> {
  MusicBloc() : super(MusicLoading()) {
    on<LoadMusicEvent>(_onLoadMusic);
    // Add the event immediately when the bloc is created
    add(LoadMusicEvent());
  }

  Future<void> _onLoadMusic(LoadMusicEvent event, Emitter<MusicState> emit) async {
    emit(MusicLoading());
    try {
      await Future.delayed(const Duration(milliseconds: 500)); // Simulate loading
      final String response = await rootBundle.loadString('assets/data/music.json');
      final data = await json.decode(response);
      print('Loaded music data: $data');
      final List<Music> musics = (data['musics'] as List).map((e) => Music.fromJson(e)).toList();
      emit(MusicLoaded(musics));
    } catch (e, stack) {
      print('Error loading music: $e');
      print(stack);
      emit(MusicError('Failed to load music data'));
    }
  }
}