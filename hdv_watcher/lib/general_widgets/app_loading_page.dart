import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hdv_watcher/features/item/presentation/providers/fetch_item_provider.dart';

import '../features/item/presentation/providers/fetch_item/state/fetch_item_state.dart';

class AppLoadingPage extends ConsumerStatefulWidget {
  const AppLoadingPage({super.key});

  @override
  ConsumerState<AppLoadingPage> createState() => _AppLoadingPageState();
}

class _AppLoadingPageState extends ConsumerState<AppLoadingPage> {
  @override
  void initState() {
    ref.read(fetchItemsProvider.notifier).fetchItems();
    super.initState();
  }

  Future<FetchItemState> _checkItemState() async {
    final state = ref.watch(fetchItemsProvider);
    return state;
  }

  Widget _screenToDisplay({
    required FetchItemState? state,
  }) {
    if (state is Loaded) {
      final item = ref.read(fXpListProvider);

      return Text(item.items.first.xpQuantity.toString());
    }
    if (state is Loading) {
      return const CircularProgressIndicator();
    }

    return const Text(
      "Error",
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _checkItemState(),
        builder: (context, snapshot) {
          return _screenToDisplay(state: snapshot.data);
        });
  }
}
