import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hdv_watcher/core/errors/failures.dart';
import 'package:hdv_watcher/features/item/domain/usecase/fetch_items_usecase.dart';
import 'package:hdv_watcher/features/item/presentation/providers/item/state/item_state.dart';

class ItemNotifier extends StateNotifier<ItemState> {
  final FetchItemsUsecase fetchItemsUsecase;

  ItemNotifier({required this.fetchItemsUsecase}) : super(Loading());
  ItemState get initialState => Loading();

  Future<ItemState> fetchItem() async {
    final response = await fetchItemsUsecase.call();

    response.fold((failure) {
      if (failure is ServerFailure) {
        state = Error(errorMessage: failure.errorMessage);
      }
    }, (success) {
      state = Loaded(items: success);
    });
    return state;
  }
}
