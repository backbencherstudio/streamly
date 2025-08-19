import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/music/music_model.dart';
import 'view_all_event.dart';
import 'view_all_state.dart';

class ViewAllBloc extends Bloc<ViewAllEvent, ViewAllState> {
  ViewAllBloc() : super(ViewAllLoading()) {
    on<LoadViewAllEvent>(_onLoadViewAll);
    add(LoadViewAllEvent());
  }

  Future<void> _onLoadViewAll(LoadViewAllEvent event, Emitter<ViewAllState> emit) async {
    emit(ViewAllLoading());
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      final String response = await rootBundle.loadString('assets/data/content.json');
      final data = json.decode(response);
      final List<Music> musics = (data['episodes'] as List).map((e) => Music.fromJson(e)).toList();
      emit(ViewAllLoaded(musics));
    } catch (e, stack) {
      print('Error loading content: $e');
      print(stack);
      emit(ViewAllError('Failed to load content data'));
    }
  }
}
