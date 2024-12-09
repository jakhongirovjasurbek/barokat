part of 'platform_bloc.dart';

class PlatformState {
  final LoadingStatus status;
  final int selectedTab;

  const PlatformState({
    this.status = LoadingStatus.pure,
    this.selectedTab = 1,
  });

  PlatformState copyWith({
    LoadingStatus? status,
    int? selectedTab,
  }) {
    return PlatformState(
      status: status ?? this.status,
      selectedTab: selectedTab ?? this.selectedTab,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PlatformState &&
          runtimeType == other.runtimeType &&
          status == other.status &&
          selectedTab == other.selectedTab;

  @override
  int get hashCode => status.hashCode ^ selectedTab.hashCode;
}
