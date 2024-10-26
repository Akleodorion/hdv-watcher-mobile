import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hdv_watcher/core/errors/failures.dart';
import 'package:hdv_watcher/features/item/domain/entitie/item.dart';
import 'package:hdv_watcher/features/item/domain/usecase/fetch_item_usecase.dart';
import 'package:hdv_watcher/features/item/presentation/providers/items/notifiers/items_list_notifier.dart';
import 'package:hdv_watcher/features/item/presentation/providers/items/providers/unit_items_list_provider.dart';
import 'package:hdv_watcher/features/item/presentation/providers/items/state/fetch_item_state.dart';
import 'package:hdv_watcher/features/item/presentation/providers/items/state/item_list_state.dart'
    as il;

class FetchItemNotifier extends StateNotifier<FetchItemState> {
  final FetchItemUsecase fetchItemsUsecase;

  FetchItemNotifier({required this.fetchItemsUsecase}) : super(Unloaded());
  FetchItemState get initialState => Unloaded();

  Future<FetchItemState> fetchItem({
    required Item item,
    required WidgetRef ref,
    required StateNotifierProvider<ItemsListNotifier, il.ItemsListState>
        provider,
  }) async {
    state = Loading();
    final response = await fetchItemsUsecase.call(item: item);

    response.fold(
      (failure) {
        if (failure is ServerFailure) {
          state = Error(errorMessage: failure.errorMessage, item: null);
        }
      },
      (success) {
        state = Loaded(item: success);
        ref.read(provider.notifier).updateItemFromList(newItem: success);
      },
    );
    return state;
  }

  void resetState() {
    state = Unloaded();
  }

  void setStateToLoaded({required Item item}) {
    state = Loaded(item: item);
  }
}
