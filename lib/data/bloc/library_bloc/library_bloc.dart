import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/utils/dummy_data.dart';
import '../../model/movie/category_model.dart';
import 'library_event.dart';
import 'library_state.dart';

class LibraryBloc extends Bloc<LibraryEvent, LibraryState> {
  LibraryBloc() : super(LibraryInitial()) {
    on<LoadLibrary>(_onLoadLibrary);
    on<SearchQueryChanged>(_onSearchQueryChanged);
    on<FocusSearchField>(_onFocusSearchField);

    // New event handlers
    on<CategoryChanged>(_onCategoryChanged);
    on<GenreChanged>(_onGenreChanged);
    on<YearChanged>(_onYearChanged);
    on<KeywordChanged>(_onKeywordChanged);
    on<TopRatedChanged>(_onTopRatedChanged);
    on<SubmitFilterForm>(_onSubmitFilterForm);
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
      emit(current.copyWith());
    }
  }

  void _onCategoryChanged(CategoryChanged event, Emitter<LibraryState> emit) {
    if (state is LibraryLoaded) {
      final current = state as LibraryLoaded;
      emit(current.copyWith(selectedCategory: event.category));
    }
  }

  void _onGenreChanged(GenreChanged event, Emitter<LibraryState> emit) {
    if (state is LibraryLoaded) {
      final current = state as LibraryLoaded;
      emit(current.copyWith(selectedGenre: event.genre));
    }
  }

  void _onYearChanged(YearChanged event, Emitter<LibraryState> emit) {
    if (state is LibraryLoaded) {
      final current = state as LibraryLoaded;
      emit(current.copyWith(selectedYear: event.year));
    }
  }

  void _onKeywordChanged(KeywordChanged event, Emitter<LibraryState> emit) {
    if (state is LibraryLoaded) {
      final current = state as LibraryLoaded;
      emit(current.copyWith(keyword: event.keyword));
    }
  }

  void _onTopRatedChanged(TopRatedChanged event, Emitter<LibraryState> emit) {
    if (state is LibraryLoaded) {
      final current = state as LibraryLoaded;
      emit(current.copyWith(topRated: event.topRated));
    }
  }

  void _onSubmitFilterForm(SubmitFilterForm event, Emitter<LibraryState> emit) {
    // This could trigger navigation via a UI listener on BlocListener
    // Currently does nothing but retain state
  }
}
