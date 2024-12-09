import 'package:barokat/core/enums/loading_status.dart';
import 'package:bloc/bloc.dart';

part 'platform_event.dart';
part 'platform_state.dart';

class PlatformBloc extends Bloc<PlatformEvent, PlatformState> {
  PlatformBloc() : super(const PlatformState()) {
    on<PlatformTabSelected>((event, emit) {
      emit(state.copyWith(selectedTab: event.tabIndex));
    });
  }
}
