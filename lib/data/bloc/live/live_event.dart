enum TabFilter { all, LiveSports, popular }

abstract class LiveEvent {}

class LoadLiveUsers extends LiveEvent {}

class ChangeTab extends LiveEvent {
  final TabFilter filter;

  ChangeTab(this.filter);
}
