import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hdv_watcher/core/providers/occupied/state/occupied_state.dart';

class OccupiedNotifier extends StateNotifier<OccupiedState> {
  OccupiedNotifier() : super(Loaded());

  OccupiedState get initialState => Loaded();

  Future<OccupiedState> setStateToLoading() async {
    state = Loading();
    return state;
  }

  Future<OccupiedState> setStateToLoaded() async {
    state = Loaded();
    return state;
  }
}
