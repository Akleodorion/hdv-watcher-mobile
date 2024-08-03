import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hdv_watcher/features/item/presentation/providers/items/providers/hundred_items_provider.dart';
import 'package:hdv_watcher/features/item/presentation/providers/items/providers/tenth_items_provider.dart';
import 'package:hdv_watcher/features/item/presentation/providers/items/providers/unit_items_provider.dart';

import '../../../../../../../../core/classes/items/item_list.dart';
import '../../../../../../../../core/enums/price_type.dart';

ProviderListenable<ItemList?> retrieveItemList(
    {required Map<PriceType, bool> mapData}) {
  final filterKey = retrieveActiveFilterKey(mapData);
  final providerName = _filtered(filterKey);
  return providerName;
}

PriceType retrieveActiveFilterKey(Map<PriceType, bool> mapData) {
  return mapData.entries.firstWhere((element) => element.value == true).key;
}

ProviderListenable<ItemList?> _filtered(PriceType filter) {
  final Map<PriceType, ProviderListenable<ItemList?>> map = {
    PriceType.unit: validUnitPriceItemsProvider,
    PriceType.tenth: validTenthPriceItemsProvider,
    PriceType.hundred: validHundredPriceItemsProvider,
  };
  return map[filter]!;
}
