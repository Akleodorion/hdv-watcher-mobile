import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hdv_watcher/features/item/presentation/providers/fetch_item_provider.dart';
import 'package:hdv_watcher/obects/classes/items/item_list.dart';
import 'package:hdv_watcher/obects/classes/items/ressource_xp_list.dart';
import 'package:hdv_watcher/pages/error_page.dart';
import 'package:hdv_watcher/pages/loaded_page.dart';
import 'package:hdv_watcher/pages/loading_page.dart';

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
      final ItemList itemList = ref.read(ressourceItemsProvider);
      final RessourceXpList xpList = ref.read(fXpListProvider);
      return LoadedPage(
        itemList: itemList,
        xpList: xpList,
      );
    }

    if (state is Loading) {
      return const LoadingPage();
    }

    return const ErrorPage();
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
