import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hdv_watcher/features/item/presentation/providers/items/providers/unit_items_provider.dart';

class MyList extends ConsumerStatefulWidget {
  const MyList({super.key});

  @override
  ConsumerState<MyList> createState() => _MyListState();
}

class _MyListState extends ConsumerState<MyList> {
  @override
  Widget build(BuildContext context) {
    final items = ref.watch(validUnitPriceItemsProvider).items;

    return Expanded(
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: const BoxDecoration(color: Colors.amber),
              margin: const EdgeInsets.symmetric(vertical: 10),
              height: 100,
              child: Center(child: Text(items[index].name)),
            ),
          );
        },
      ),
    );
  }
}
