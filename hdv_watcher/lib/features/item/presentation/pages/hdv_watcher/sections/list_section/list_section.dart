import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hdv_watcher/core/enums/price_type.dart';
import 'package:hdv_watcher/features/item/presentation/pages/hdv_watcher/sections/list_section/functions/retrieve_item_list.dart';
import 'package:hdv_watcher/features/item/presentation/pages/hdv_watcher/sections/list_section/widgets/item_card.dart';
import 'package:hdv_watcher/features/item/presentation/providers/price_type/price_type_filter_provider.dart';

import '../../../../../domain/entitie/item.dart';

class ListSection extends ConsumerWidget {
  const ListSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterState = ref.watch(priceTypeFilterProvider);
    List<Item> items =
        ref.read(retrieveItemList(mapData: filterState))!.sortedPriceList;
    final PriceType selectedPriceType = retrieveActiveFilterKey(filterState);

    late final Widget content;

    if (items.isEmpty) {
      content = const Center(
        child: Text("Aucune donnée ne passe les filtres"),
      );
    } else {
      content = Expanded(
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (BuildContext context, index) {
            return ItemCard(item: items[index], priceType: selectedPriceType);
          },
        ),
      );
    }

    return content;
  }
}
