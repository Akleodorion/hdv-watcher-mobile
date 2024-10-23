import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hdv_watcher/features/item/presentation/providers/items/providers/hundred_items_list_provider.dart';
import 'package:hdv_watcher/features/item/presentation/providers/items/providers/tenth_items_list_provider.dart';
import 'package:hdv_watcher/features/item/presentation/providers/items/providers/unit_items_list_provider.dart';
import 'package:hdv_watcher/features/item/presentation/providers/items/state/item_list_state.dart';

import '../../../../../../../core/classes/items/item_list.dart';
import '../../../../../../../core/enums/price_type.dart';

ProviderListenable<ItemList?> retrieveItemList(
    {required Map<PriceType, bool> mapData}) {
  final filterKey = retrieveActiveFilterKey(mapData);
  final providerName = _provider(filterKey);
  return providerName;
}

ProviderListenable<ItemsListState?> retrieveState(
    {required Map<PriceType, bool> mapData}) {
  final filterKey = retrieveActiveFilterKey(mapData);
  final state = _state(filterKey);
  return state;
}

Future<ItemsListState> Function() retrieveInitiateFunction(
    {required WidgetRef ref, required Map<PriceType, bool> mapData}) {
  final filterKey = retrieveActiveFilterKey(mapData);
  final function = fetchInitialPaginatedItem(ref, filterKey);
  return function;
}

PriceType retrieveActiveFilterKey(Map<PriceType, bool> mapData) {
  return mapData.entries.firstWhere((element) => element.value == true).key;
}

ProviderListenable<ItemList?> _provider(PriceType filter) {
  final Map<PriceType, ProviderListenable<ItemList?>> map = {
    PriceType.unit: validUnitPriceItemsProvider,
    PriceType.tenth: validTenthPriceItemsProvider,
    PriceType.hundred: validHundredPriceItemsProvider,
  };
  return map[filter]!;
}

ProviderListenable<ItemsListState?> _state(PriceType filter) {
  final Map<PriceType, ProviderListenable<ItemsListState?>> map = {
    PriceType.unit: unitItemsProvider,
    PriceType.tenth: tenthItemsProvider,
    PriceType.hundred: hundredItemsProvider,
  };
  return map[filter]!;
}

Future<ItemsListState> Function() fetchInitialPaginatedItem(
    WidgetRef ref, PriceType filter) {
  final Map<PriceType, Future<ItemsListState> Function()> map = {
    PriceType.unit:
        ref.read(unitItemsProvider.notifier).fetchInitialPaginatedItems,
    PriceType.tenth:
        ref.read(tenthItemsProvider.notifier).fetchInitialPaginatedItems,
    PriceType.hundred:
        ref.read(hundredItemsProvider.notifier).fetchInitialPaginatedItems,
  };
  return map[filter]!;
}
