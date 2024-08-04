import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hdv_watcher/core/enums/price_type.dart';
import 'package:hdv_watcher/core/errors/failures.dart';
import 'package:hdv_watcher/features/item/domain/entitie/item.dart';
import 'package:hdv_watcher/features/item/domain/usecase/fetch_paginated_items_usecase.dart';
import 'package:hdv_watcher/features/item/presentation/providers/items/state/item_state.dart';

class ItemsNotifier extends StateNotifier<ItemState> {
  final FetchPaginatedItemsUsecase usecase;
  final PriceType priceType;
  ItemsNotifier({required this.usecase, required this.priceType})
      : super(Unloaded()) {
    fetchInitialPaginatedItems();
  }

  ItemState get initialState => Unloaded();

  Future<ItemState> fetchInitialPaginatedItems() async {
    state = Loading();
    final response = await usecase.call(pageIndex: 0, priceType: priceType);

    response!.fold((failure) {
      if (failure is ServerFailure) {
        state = Error(
            errorMessage: failure.errorMessage,
            items: const [],
            numberOfBatches: 0,
            bachesCounter: 0);
      }
    }, (sucess) {
      state = Loaded(
          items: sucess["items"],
          numberOfBatches: sucess["batches"],
          bachesCounter: 0);
    });
    return state;
  }

  Future<ItemState> fetchPaginatedItems(
      {required int pageIndex, required ItemState itemState}) async {
    final response =
        await usecase.call(pageIndex: pageIndex, priceType: priceType);
    response!.fold((failure) {
      if (itemState is Loaded && failure is ServerFailure) {
        state = Error(
            errorMessage: failure.errorMessage,
            items: itemState.items,
            numberOfBatches: itemState.numberOfBatches,
            bachesCounter: itemState.bachesCounter);
      }
    }, (success) {
      if (itemState is Loaded) {
        final updatedItems = List<Item>.from(itemState.items)
          ..addAll(success["items"]);
        state = itemState.copyWith(items: updatedItems);
      }
    });
    return state;
  }
}
