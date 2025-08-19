// bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:streamly/data/bloc/search_result/search_result_state.dart';

import '../../../core/utils/dummy_data.dart';


class SearchResultBloc extends Cubit<SearchResultState> {
  SearchResultBloc() : super(SearchResultLoading()) {
    loadData();
  }

  void loadData() async {
    await Future.delayed(Duration(milliseconds: 500));
    emit(SearchResultLoaded(dummyCategories));
  }
}
