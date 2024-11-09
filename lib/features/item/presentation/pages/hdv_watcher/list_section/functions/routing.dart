import 'package:flutter/material.dart';
import 'package:hdv_watcher/core/enums/price_type.dart';
import 'package:hdv_watcher/features/item/presentation/pages/hdv_watcher/list_section/widgets/item_list_builder/item_list_builder.dart';
import 'package:hdv_watcher/features/item/presentation/providers/items/providers/hundred_items_list_provider.dart';
import 'package:hdv_watcher/features/item/presentation/providers/items/providers/tenth_items_list_provider.dart';
import 'package:hdv_watcher/features/item/presentation/providers/items/providers/unit_items_list_provider.dart';

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
