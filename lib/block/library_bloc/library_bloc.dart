import 'package:flutter_bloc/flutter_bloc.dart';
import '../../model/movie/category_model.dart';
import '../../utils/dummy_data.dart';
import 'library_event.dart';
import 'library_state.dart';

class LibraryBloc extends Bloc<LibraryEvent, LibraryState> {
  LibraryBloc() : super(LibraryInitial()) {
    on<LoadLibrary>(_onLoadLibrary);
    on<SearchQueryChanged>(_onSearchQueryChanged);
    on<FocusSearchField>(_onFocusSearchField);
  }

  void _onLoadLibrary(LoadLibrary event, Emitter<LibraryState> emit) async {
    emit(LibraryLoading());
    try {
      final categoriesJson = dummyJson['categories'] as List;
      final categories =
      categoriesJson.map((json) => Category.fromJson(json)).toList();
      emit(LibraryLoaded(categories));
    } catch (e) {
      emit(LibraryError('Failed to load library data.'));
    }
  }

  void _onSearchQueryChanged(SearchQueryChanged event, Emitter<LibraryState> emit) {
    if (state is LibraryLoaded) {
      final current = state as LibraryLoaded;
      emit(current.copyWith(
        searchQuery: event.query,
        showSuggestions: event.query.isNotEmpty,
      ));
    }
  }
  void _onFocusSearchField(FocusSearchField event, Emitter<LibraryState> emit) {
    if (state is LibraryLoaded) {
      final current = state as LibraryLoaded;
      emit(current.copyWith(

      ));
    }
  }
}
