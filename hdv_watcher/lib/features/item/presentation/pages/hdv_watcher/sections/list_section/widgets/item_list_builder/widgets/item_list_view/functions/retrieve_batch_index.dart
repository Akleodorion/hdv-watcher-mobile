import 'package:hdv_watcher/features/item/presentation/providers/items/state/item_state.dart';

int retrieveBatchIndex(ItemState state) {
  if (state is Loaded) {
    return state.bachesCounter;
  }
  if (state is Error) {
    return state.bachesCounter;
  }
  return 0;
}
