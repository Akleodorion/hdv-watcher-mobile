import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hdv_watcher/core/providers/occupied/providers/occupied_provider.dart';
import 'package:hdv_watcher/core/providers/occupied/state/occupied_state.dart';

Future<OccupiedState> stateWatcher(WidgetRef ref) async {
  return await ref.watch(occupiedProvider);
}
