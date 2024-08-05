import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hdv_watcher/core/providers/occupied/nottifiers/occupied_notifier.dart';
import 'package:hdv_watcher/core/providers/occupied/state/occupied_state.dart';

final occupiedProvider =
    StateNotifierProvider<OccupiedNotifier, OccupiedState>((ref) {
  return OccupiedNotifier();
});
