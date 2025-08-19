import '../../model/live/live_model.dart';
import 'live_event.dart';

abstract class LiveState {}

class LiveInitial extends LiveState {}

class LiveLoading extends LiveState {}

class LiveLoaded extends LiveState {
  final List<LiveUser> users;
  final TabFilter selectedTab;

  LiveLoaded(this.users, this.selectedTab);
}

class LiveError extends LiveState {
  final String message;

  LiveError(this.message);
}
