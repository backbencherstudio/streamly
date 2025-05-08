import 'package:flutter_bloc/flutter_bloc.dart';
import '../../model/live/live_model.dart';
import '../../utils/dummy_data.dart';
import 'live_event.dart';
import 'live_state.dart';

class LiveBloc extends Bloc<LiveEvent, LiveState> {
  final List<LiveUser> _allUsers =
  dummyLiveData.map((e) => LiveUser.fromJson(e)).toList();

  LiveBloc() : super(LiveInitial()) {
    on<LoadLiveUsers>(_onLoad);
    on<ChangeTab>(_onTabChanged);
  }

  void _onLoad(LoadLiveUsers event, Emitter<LiveState> emit) {
    emit(LiveLoaded(_allUsers, TabFilter.all));
  }

  void _onTabChanged(ChangeTab event, Emitter<LiveState> emit) {
    List<LiveUser> filtered;

    switch (event.filter) {
      case TabFilter.popular:
        filtered = _allUsers.where((u) => u.views.contains('M')).toList();
        break;
      case TabFilter.following:
        filtered = _allUsers.where((u) => u.name.contains('Ryan')).toList();
        break;
      case TabFilter.all:
      default:
        filtered = _allUsers;
    }

    emit(LiveLoaded(filtered, event.filter));
  }
}
