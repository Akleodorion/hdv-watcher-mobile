import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hdv_watcher/features/item/presentation/providers/items/providers/hundred_items_provider.dart';
import 'package:hdv_watcher/features/item/presentation/providers/items/providers/tenth_items_provider.dart';
import 'package:hdv_watcher/features/item/presentation/providers/items/providers/unit_items_provider.dart';
import 'package:hdv_watcher/features/item/presentation/providers/items/state/item_state.dart';

import '../../../../../../../core/classes/items/item_list.dart';
import '../../../../../../../core/enums/price_type.dart';

ProviderListenable<ItemList?> retrieveItemList(
    {required Map<PriceType, bool> mapData}) {
  final filterKey = retrieveActiveFilterKey(mapData);
  final providerName = _provider(filterKey);
  return providerName;
}

ProviderListenable<ItemState?> retrieveState(
    {required Map<PriceType, bool> mapData}) {
  final filterKey = retrieveActiveFilterKey(mapData);
  final state = _state(filterKey);
  return state;
}

Future<ItemState> Function() retrieveInitiateFunction(
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

ProviderListenable<ItemState?> _state(PriceType filter) {
  final Map<PriceType, ProviderListenable<ItemState?>> map = {
    PriceType.unit: unitItemsProvider,
    PriceType.tenth: tenthItemsProvider,
    PriceType.hundred: hundredItemsProvider,
  };
  return map[filter]!;
}

Future<ItemState> Function() fetchInitialPaginatedItem(
    WidgetRef ref, PriceType filter) {
  final Map<PriceType, Future<ItemState> Function()> map = {
    PriceType.unit:
        ref.read(unitItemsProvider.notifier).fetchInitialPaginatedItems,
    PriceType.tenth:
        ref.read(tenthItemsProvider.notifier).fetchInitialPaginatedItems,
    PriceType.hundred:
        ref.read(hundredItemsProvider.notifier).fetchInitialPaginatedItems,
  };
  return map[filter]!;
}
