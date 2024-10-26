import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hdv_watcher/core/errors/failures.dart';
import 'package:hdv_watcher/features/item/domain/entitie/item.dart';
import 'package:hdv_watcher/features/item/domain/usecase/fetch_item_usecase.dart';
import 'package:hdv_watcher/features/item/presentation/providers/items/state/fetch_item_state.dart';

class FetchItemNotifier extends StateNotifier<FetchItemState> {
  final FetchItemUsecase fetchItemsUsecase;

  FetchItemNotifier({required this.fetchItemsUsecase}) : super(Unloaded());
  FetchItemState get initialState => Unloaded();

  Future<FetchItemState> fetchItem({
    required Item item,
    required dynamic provider,
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
        provider.updateItemFromList(newItem: success);
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
