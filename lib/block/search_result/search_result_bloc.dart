// bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:streamly/block/search_result/search_result_state.dart';

import '../../utils/dummy_data.dart';

class SearchResultBloc extends Cubit<SearchResultState> {
  SearchResultBloc() : super(SearchResultLoading()) {
    loadData();
  }

  void loadData() async {
    await Future.delayed(Duration(milliseconds: 500)); // simulate delay
    emit(SearchResultLoaded(dummyCategories));
  }
}
