import 'package:flutter_bloc/flutter_bloc.dart';
import 'live_view_event.dart';
import 'live_view_state.dart';
import '../../utils/dummy_data.dart';

class LiveViewBloc extends Bloc<LiveViewEvent, LiveViewState> {
  LiveViewBloc() : super(LiveViewInitial()) {
    on<LoadLiveView>((event, emit) async {
      emit(LiveViewLoading());
      try {
        await Future.delayed(Duration(seconds: 1)); // Simulate network delay
        emit(LiveViewLoaded(dummyLiveView));
      } catch (e) {
        emit(LiveViewError('Failed to load live view'));
      }
    });
  }
}
