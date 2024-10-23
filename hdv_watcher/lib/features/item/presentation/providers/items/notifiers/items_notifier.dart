import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hdv_watcher/core/enums/price_type.dart';
import 'package:hdv_watcher/core/errors/failures.dart';
import 'package:hdv_watcher/features/item/domain/entitie/item.dart';
import 'package:hdv_watcher/features/item/domain/usecase/fetch_paginated_items_usecase.dart';
import 'package:hdv_watcher/features/item/presentation/providers/items/state/item_state.dart';

class ItemsNotifier extends StateNotifier<ItemListState> {
  final FetchPaginatedItemsUsecase usecase;
  final PriceType priceType;
  ItemsNotifier({required this.usecase, required this.priceType})
      : super(Unloaded()) {
    // fetchInitialPaginatedItems();
  }

  ItemListState get initialState => Unloaded();

  Future<ItemListState> fetchInitialPaginatedItems() async {
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

  Future<ItemListState> fetchPaginatedItems(
      {required int pageIndex,
      required ItemListState itemListState,
      required int batchSize}) async {
    final response = await usecase.call(
        pageIndex: pageIndex, priceType: priceType, batchSize: batchSize);
    response!.fold((failure) {
      if (itemListState is Loaded && failure is ServerFailure) {
        state = Error(
            errorMessage: failure.errorMessage,
            items: itemListState.items,
            numberOfBatches: itemListState.numberOfBatches,
            bachesCounter: itemListState.bachesCounter);
      }
    }, (success) {
      if (itemListState is Loaded) {
        final updatedItems = List<Item>.from(itemListState.items)
          ..addAll(success["items"]);
        state = itemListState.copyWith(items: updatedItems);
      }
    });
    return state;
  }
}
