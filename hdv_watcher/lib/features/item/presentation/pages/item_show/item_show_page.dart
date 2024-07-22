import 'package:flutter/material.dart';
import 'package:hdv_watcher/features/item/domain/entitie/item.dart';
import 'package:hdv_watcher/features/item/presentation/pages/item_show/layout/item_show_page_layout.dart';

class ItemShowPage extends StatelessWidget {
  const ItemShowPage({super.key, required this.item});
  final Item item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.name),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite),
          )
        ],
      ),
      body: ItemShowPageLayout(
        item: item,
      ),
    );
  }
}
