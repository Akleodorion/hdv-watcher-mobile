import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hdv_watcher/core/enums/price_type.dart';
import 'package:hdv_watcher/features/item/presentation/pages/hdv_watcher/sections/list_section/widgets/item_card.dart';
import 'package:hdv_watcher/features/item/presentation/providers/items/notifiers/items_notifier.dart';
import 'package:hdv_watcher/features/item/presentation/providers/items/state/item_state.dart';

class ItemListBuilder extends ConsumerStatefulWidget {
  const ItemListBuilder({
    super.key,
    required this.provider,
    required this.notifier,
    required this.priceType,
  });

  final StateNotifierProvider<ItemsNotifier, ItemState> notifier;
  final Provider<dynamic> provider;
  final PriceType priceType;
  @override
  ConsumerState<ItemListBuilder> createState() => _ItemListBuilderState();
}

class _ItemListBuilderState extends ConsumerState<ItemListBuilder> {
  Future<ItemState> _itemState() async {
    final ItemState state = ref.watch(widget.notifier);
    return state;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _itemState(),
        builder: (context, snapshot) {
          final state = snapshot.data;
          final items = ref.read(widget.provider).sortedPriceList;

          if (state is Unloaded) {
            return Center(
              child:
                  ElevatedButton(onPressed: () {}, child: const Text("charge")),
            );
          }
          return snapshot.hasData
              ? Expanded(
                  child: ListView.builder(
                    itemCount: items.length + 1,
                    itemBuilder: (BuildContext context, index) {
                      if (index == items.length) {
                        return ElevatedButton(
                            onPressed: () {}, child: const Text("Charge more"));
                      }
                      return ItemCard(
                          item: items[index], priceType: widget.priceType);
                    },
                  ),
                )
              : const Center(
                  child: CircularProgressIndicator(),
                );
        });
  }
}
