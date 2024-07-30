import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hdv_watcher/pages/initial_loading_page.dart';
import '../../pages/item_features_page.dart';
import 'package:hdv_watcher/features/item/presentation/providers/items/item_provider.dart';

import '../features/item/presentation/providers/items/state/item_state.dart';

class RoutingWidget extends ConsumerStatefulWidget {
  const RoutingWidget({super.key});

  @override
  ConsumerState<RoutingWidget> createState() => _RoutingWidgetState();
}

class _RoutingWidgetState extends ConsumerState<RoutingWidget> {
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
    return const InitialLoadingPage();
  }

  // Widget
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _watchItemState(),
        builder: (BuildContext context, snapshot) {
          final state = snapshot.data;
          return snapshot.hasData ? routing(state) : const InitialLoadingPage();
        });
  }
}
