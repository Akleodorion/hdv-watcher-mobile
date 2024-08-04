import 'package:flutter/material.dart';
import 'package:hdv_watcher/core/enums/price_type.dart';
import 'package:hdv_watcher/features/item/domain/entitie/item.dart';
import 'package:hdv_watcher/features/item/presentation/pages/hdv_watcher/sections/list_section/widgets/item_card.dart';

class ItemListView extends StatelessWidget {
  const ItemListView({super.key, required this.items, required this.priceType});

  final List<Item> items;
  final PriceType priceType;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: items.length + 1,
        itemBuilder: (BuildContext context, index) {
          if (index == items.length) {
            return ElevatedButton(
                onPressed: () {}, child: const Text("Charge more"));
          }
          return ItemCard(item: items[index], priceType: priceType);
        },
      ),
    );
  }
}
