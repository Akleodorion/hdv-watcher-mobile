import 'package:hdv_watcher/core/errors/failures.dart';
import 'package:hdv_watcher/features/item/domain/usecases/fetch_items_usecase.dart';
import 'package:hdv_watcher/features/item/presentation/providers/fetch_item/state/fetch_item_state.dart';
import 'package:riverpod/riverpod.dart';

class FetchItemNotifier extends StateNotifier<FetchItemState> {
  FetchItemNotifier( {required this.fetchItemsUsecase}) : super (Loading());

  final FetchItemsUsecase fetchItemsUsecase;

  FetchItemState get initialState => Loading();

  Future<FetchItemState> fetchItems() async {
    final result = await fetchItemsUsecase.call();
    result.fold((failure) {
      if (failure is ServerFailure) {
      state =  Error(message: failure.errorMessage);
      }
    }, (success) {
      state =  Loaded(items: success);
    });
    return state;
  }
}