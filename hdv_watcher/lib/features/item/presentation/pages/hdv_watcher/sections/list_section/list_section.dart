import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hdv_watcher/core/enums/price_type.dart';
import 'package:hdv_watcher/features/item/presentation/pages/hdv_watcher/sections/list_section/functions/retrieve_item_list.dart';
import 'package:hdv_watcher/features/item/presentation/pages/hdv_watcher/sections/list_section/widgets/item_list_builder.dart';
import 'package:hdv_watcher/features/item/presentation/providers/items/providers/hundred_items_provider.dart';
import 'package:hdv_watcher/features/item/presentation/providers/items/providers/tenth_items_provider.dart';
import 'package:hdv_watcher/features/item/presentation/providers/items/providers/unit_items_provider.dart';
import 'package:hdv_watcher/features/item/presentation/providers/price_type/price_type_filter_provider.dart';

class ListSection extends ConsumerStatefulWidget {
  const ListSection({super.key});

  @override
  ConsumerState<ListSection> createState() => _ListSectionState();
}

class _ListSectionState extends ConsumerState<ListSection> {
  @override
  Widget build(BuildContext context) {
    final filterState = ref.watch(priceTypeFilterProvider);
    final priceType = retrieveActiveFilterKey(filterState);

    return routing(priceType);
  }

  Widget routing(PriceType priceType) {
    final Map<PriceType, Widget> mapData = {
      PriceType.unit: ItemListBuilder(
          provider: validUnitPriceItemsProvider,
          notifier: unitItemsProvider,
          priceType: PriceType.unit),
      PriceType.tenth: ItemListBuilder(
          provider: validTenthPriceItemsProvider,
          notifier: tenthItemsProvider,
          priceType: PriceType.tenth),
      PriceType.hundred: ItemListBuilder(
          provider: validHundredPriceItemsProvider,
          notifier: hundredItemsProvider,
          priceType: PriceType.hundred),
    };
    return mapData[priceType]!;
  }
}
