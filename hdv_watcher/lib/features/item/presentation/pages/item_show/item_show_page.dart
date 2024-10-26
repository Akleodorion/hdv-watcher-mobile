import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hdv_watcher/features/item/domain/entitie/item.dart';
import 'package:hdv_watcher/features/item/presentation/pages/item_show/layout/item_show_page_layout.dart';
import 'package:hdv_watcher/features/item/presentation/providers/chart_filter/chart_filter_provider.dart';
import 'package:hdv_watcher/features/item/presentation/providers/items/providers/fetch_item_provider.dart';
import 'package:hdv_watcher/features/item/presentation/providers/items/state/fetch_item_state.dart';

class ItemShowPage extends ConsumerWidget {
  const ItemShowPage({super.key, required this.item});
  final Item item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future<FetchItemState> fetchItemState({required WidgetRef ref}) async {
      final state = ref.watch(fetchItemProvider);
      return state;
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            ref.read(chartFilterProvider.notifier).setBaseFilter();
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(item.name),
      ),
      body: FutureBuilder(
        future: fetchItemState(ref: ref),
        builder: (context, snapshot) {
          final state = ref.read(fetchItemProvider);
          if (snapshot.data is Loaded && state is Loaded) {
            return ItemShowPageLayout(item: state.item);
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
