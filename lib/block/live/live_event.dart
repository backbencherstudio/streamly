enum TabFilter { all, popular, following }

abstract class LiveEvent {}

class LoadLiveUsers extends LiveEvent {}

class ChangeTab extends LiveEvent {
  final TabFilter filter;

  ChangeTab(this.filter);
}
