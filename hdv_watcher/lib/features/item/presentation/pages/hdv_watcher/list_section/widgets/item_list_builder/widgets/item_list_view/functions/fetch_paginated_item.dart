import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hdv_watcher/core/providers/occupied/providers/occupied_provider.dart';
import 'package:hdv_watcher/features/item/presentation/providers/items/notifiers/items_list_notifier.dart';
import 'package:hdv_watcher/features/item/presentation/providers/items/state/item_list_state.dart';

Future<void> fetchPaginatedItem(
    WidgetRef ref,
    int counter,
    ItemsListState state,
    StateNotifierProvider<ItemsListNotifier, ItemsListState>
        stateNotifier) async {
  ref.read(occupiedProvider.notifier).setStateToLoading();

  await ref.read(stateNotifier.notifier).fetchPaginatedItems(
        pageIndex: counter,
        itemsListState: state,
        batchSize: 50,
      );

  ref.read(occupiedProvider.notifier).setStateToLoaded();
}
