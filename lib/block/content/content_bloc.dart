import 'package:flutter_bloc/flutter_bloc.dart';
import '../../repository/content/content_repository.dart';
import 'content_event.dart';
import 'content_state.dart';

class ContentBloc extends Bloc<ContentEvent, ContentState> {
  final ContentRepository repository;

  ContentBloc({required this.repository}) : super(ContentInitial()) {
    on<LoadContentEvent>(_onLoadContent);
    on<ChangeVideoEvent>(_onChangeVideo);
  }

  void _onLoadContent(LoadContentEvent event, Emitter<ContentState> emit) async {
    emit(ContentLoading());
    try {
      final items = await repository.fetchContent(isEpisode: event.isEpisode);
      emit(ContentLoaded(items: items, selectedItem: items.first));
    } catch (e) {
      emit(ContentError(message: e.toString()));
    }
  }

  void _onChangeVideo(ChangeVideoEvent event, Emitter<ContentState> emit) {
    if (state is ContentLoaded) {
      final current = state as ContentLoaded;
      emit(ContentLoaded(items: current.items, selectedItem: event.selectedItem));
    }
  }
}
