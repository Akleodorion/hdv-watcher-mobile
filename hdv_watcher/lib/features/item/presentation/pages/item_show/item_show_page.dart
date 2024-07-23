import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hdv_watcher/features/item/domain/entitie/item.dart';
import 'package:hdv_watcher/features/item/presentation/pages/item_show/layout/item_show_page_layout.dart';
import 'package:hdv_watcher/features/item/presentation/providers/chart_filter/chart_filter_provider.dart';

class ItemShowPage extends StatelessWidget {
  const ItemShowPage({super.key, required this.item});
  final Item item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Consumer(
          builder: (context, ref, child) {
            return IconButton(
              onPressed: () {
                ref.read(chartFilterProvider.notifier).setBaseFilter();
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back),
            );
          },
        ),
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
