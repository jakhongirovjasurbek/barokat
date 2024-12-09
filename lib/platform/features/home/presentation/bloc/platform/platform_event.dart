part of 'platform_bloc.dart';

abstract class PlatformEvent {
  const PlatformEvent();
}

class PlatformTabSelected extends PlatformEvent {
  final int tabIndex;

  const PlatformTabSelected(this.tabIndex);
}
