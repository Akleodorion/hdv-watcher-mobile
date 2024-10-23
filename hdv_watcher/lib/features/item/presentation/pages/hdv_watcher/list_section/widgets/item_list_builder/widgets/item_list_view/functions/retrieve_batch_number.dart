import 'package:hdv_watcher/features/item/presentation/providers/items/state/item_list_state.dart';

int retrieveBatchNumber(ItemsListState state) {
  if (state is Loaded) {
    return state.numberOfBatches;
  }
  if (state is Error) {
    return state.numberOfBatches;
  }
  return 0;
}
