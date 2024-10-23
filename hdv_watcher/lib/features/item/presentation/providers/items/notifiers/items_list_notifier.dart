import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hdv_watcher/core/enums/price_type.dart';
import 'package:hdv_watcher/core/errors/failures.dart';
import 'package:hdv_watcher/features/item/domain/entitie/item.dart';
import 'package:hdv_watcher/features/item/domain/usecase/fetch_paginated_items_usecase.dart';
import 'package:hdv_watcher/features/item/presentation/providers/items/state/item_list_state.dart';

class ItemsListNotifier extends StateNotifier<ItemsListState> {
  final FetchPaginatedItemsUsecase usecase;
  final PriceType priceType;
  ItemsListNotifier({required this.usecase, required this.priceType})
      : super(Unloaded()) {
    // fetchInitialPaginatedItems();
  }

  ItemsListState get initialState => Unloaded();

  Future<ItemsListState> fetchInitialPaginatedItems() async {
    state = Loading();
    final response =
        await usecase.call(pageIndex: 0, priceType: priceType, batchSize: 50);

    response!.fold((failure) {
      if (failure is ServerFailure) {
        state = Error(
            errorMessage: failure.errorMessage,
            items: const [],
            numberOfBatches: 0,
            bachesCounter: 1);
      }
    }, (sucess) {
      state = Loaded(
          items: sucess["items"],
          numberOfBatches: sucess["batches"],
          bachesCounter: 1);
    });
    return state;
  }

  Future<ItemsListState> fetchPaginatedItems({
    required int pageIndex,
    required ItemsListState itemsListState,
    required int batchSize,
  }) async {
    final response = await usecase.call(
        pageIndex: pageIndex, priceType: priceType, batchSize: batchSize);
    response!.fold((failure) {
      if (itemsListState is Loaded && failure is ServerFailure) {
        state = Error(
            errorMessage: failure.errorMessage,
            items: itemsListState.items,
            numberOfBatches: itemsListState.numberOfBatches,
            bachesCounter: itemsListState.bachesCounter);
      }
    }, (success) {
      if (itemsListState is Loaded) {
        final updatedItems = List<Item>.from(itemsListState.items)
          ..addAll(success["items"]);
        state = itemsListState.copyWith(items: updatedItems);
      }
    });
    return state;
  }
}
