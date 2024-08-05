import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hdv_watcher/core/providers/occupied/providers/occupied_provider.dart';
import 'package:hdv_watcher/core/widgets/buttons/cta_button/cta_button.dart';
import 'package:hdv_watcher/features/item/presentation/pages/hdv_watcher/sections/list_section/widgets/item_list_builder/widgets/item_list_view/functions/retrieve_batch_index.dart';
import 'package:hdv_watcher/features/item/presentation/pages/hdv_watcher/sections/list_section/widgets/item_list_builder/widgets/item_list_view/functions/retrieve_batch_number.dart';
import 'package:hdv_watcher/features/item/presentation/providers/items/notifiers/items_notifier.dart';
import 'package:hdv_watcher/features/item/presentation/providers/items/state/item_state.dart';

class FetchButton extends ConsumerWidget {
  const FetchButton({super.key, required this.stateNotifier});
  final StateNotifierProvider<ItemsNotifier, ItemState> stateNotifier;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(stateNotifier);
    final int counter = retrieveBatchIndex(state);
    final int batches = retrieveBatchNumber(state);
    return (counter) < batches
        ? CtaButton(
            onTap: () async {
              ref.read(occupiedProvider.notifier).setStateToLoading();
              await ref
                  .read(stateNotifier.notifier)
                  .fetchPaginatedItems(pageIndex: counter, itemState: state);
              ref.read(occupiedProvider.notifier).setStateToLoaded();
            },
            title: "Charger plus d'objet",
          )
        : const Center(
            child: Text(" Vous avez chargés tous les objets"),
          );
  }
}
