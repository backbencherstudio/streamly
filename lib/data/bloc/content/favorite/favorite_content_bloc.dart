import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:streamly/data/bloc/content/favorite/favorite_content_event.dart';
import 'package:streamly/data/bloc/content/favorite/favorite_content_state.dart';

import '../../../repository/content/favorite/favorite_content_repository.dart';


class FavoriteContentBloc extends Bloc<FavoriteContentEvent, FavoriteContentState> {
  final FavoriteContentRepository repository;

  FavoriteContentBloc({required this.repository}) : super(FavoriteContentInitial()) {
    on<FetchFavContentEvent>(_onLoadContent);
  }

  void _onLoadContent(FetchFavContentEvent event, Emitter<FavoriteContentState> emit) async {
    emit(FavoriteContentLoading());
    try {
      final items = await repository.fetchFavoriteContent();
      emit(FavoriteContentLoaded(favoriteContent: items));
    } catch (e) {
      if (e.toString().contains('404')){
        emit(FavoriteContentError(message: 'No Favorite Content found'));
      } else {
        emit(FavoriteContentError(message: e.toString()));
      }
    }
  }
}