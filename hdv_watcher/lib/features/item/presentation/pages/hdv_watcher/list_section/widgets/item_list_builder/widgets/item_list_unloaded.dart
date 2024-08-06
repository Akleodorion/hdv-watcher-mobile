import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hdv_watcher/features/item/presentation/providers/items/notifiers/items_notifier.dart';
import 'package:hdv_watcher/features/item/presentation/providers/items/state/item_state.dart';

class ItemListUnloaded extends StatelessWidget {
  const ItemListUnloaded({super.key, required this.stateNotifier});
  final StateNotifierProvider<ItemsNotifier, ItemState> stateNotifier;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Pas de donnée pour le moment",
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(
              height: 20,
            ),
            Consumer(builder: (context, ref, child) {
              return ElevatedButton(
                  onPressed: () {
                    ref
                        .read(stateNotifier.notifier)
                        .fetchInitialPaginatedItems();
                  },
                  child: const Text(
                    "Charger les premières données",
                    style: TextStyle(fontSize: 18),
                  ));
            })
          ],
        ),
      ),
    );
  }
}
