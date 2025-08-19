import '../../model/live_view/live_view_model.dart';

abstract class LiveViewState {}

class LiveViewInitial extends LiveViewState {}

class LiveViewLoading extends LiveViewState {}

class LiveViewLoaded extends LiveViewState {
  final LiveViewModel liveViewModel;

  LiveViewLoaded(this.liveViewModel);
}

class LiveViewError extends LiveViewState {
  final String message;

  LiveViewError(this.message);
}
