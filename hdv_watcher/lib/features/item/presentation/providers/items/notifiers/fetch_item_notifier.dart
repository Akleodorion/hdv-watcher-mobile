import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hdv_watcher/core/errors/failures.dart';
import 'package:hdv_watcher/features/item/domain/usecase/fetch_item_usecase.dart';
import 'package:hdv_watcher/features/item/presentation/providers/items/state/fetch_item_state.dart';

class FetchItemNotifier extends StateNotifier<FetchItemState> {
  final FetchItemUsecase fetchItemsUsecase;

  FetchItemNotifier({required this.fetchItemsUsecase}) : super(Unloaded());
  FetchItemState get initialState => Unloaded();

  Future<FetchItemState> fetchItem({required int itemId}) async {
    final response = await fetchItemsUsecase.call(itemId: itemId);

    response.fold((failure) {
      if (failure is ServerFailure) {
        state = Error(errorMessage: failure.errorMessage, item: null);
      }
    }, (success) {
      state = Loaded(item: success);
    });
    return state;
  }
}
