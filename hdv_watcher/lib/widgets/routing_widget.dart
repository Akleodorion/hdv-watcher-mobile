import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hdv_watcher/features/item/presentation/pages/item_features_page.dart';
import 'package:hdv_watcher/features/item/presentation/providers/item_provider.dart';

import '../features/item/presentation/providers/state/item_state.dart';

class RoutingWIdget extends ConsumerStatefulWidget {
  const RoutingWIdget({super.key});

  @override
  ConsumerState<RoutingWIdget> createState() => _RoutingWIdgetState();
}

class _RoutingWIdgetState extends ConsumerState<RoutingWIdget> {
  // inits
  @override
  void initState() {
    super.initState();
    ref.read(itemProvider.notifier).fetchItem();
  }

  // méthods
  Future<ItemState> _watchItemState() async {
    final state = ref.watch(itemProvider);
    return state;
  }

  Widget routing(ItemState? state) {
    if (state is Loaded) {
      return const ItemFeaturesPage();
    }
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  // Widget
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _watchItemState(),
        builder: (BuildContext context, snapshot) {
          final state = snapshot.data;
          return routing(state);
        });
  }
}
