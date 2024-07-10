

import 'package:hdv_watcher/features/item/domain/entities/item.dart';
import 'package:hdv_watcher/features/item/domain/usecases/fetch_items_usecase.dart';
import 'package:hdv_watcher/features/item/presentation/providers/fetch_item/state/fetch_item_notifier.dart';
import 'package:hdv_watcher/features/item/presentation/providers/fetch_item/state/fetch_item_state.dart';
import 'package:riverpod/riverpod.dart';

import '../../../../injection_container.dart';

final fetchItemsProvider = StateNotifierProvider<FetchItemNotifier,FetchItemState>((ref) {
  final FetchItemsUsecase fetchItemsUsecase = sl<FetchItemsUsecase>();
  return FetchItemNotifier(fetchItemsUsecase: fetchItemsUsecase);
});


final itemsProvider = Provider<List<Item>?>((ref) {
  final state = ref.watch(fetchItemsProvider);
  if (state is Loaded) {
    return state.items;
  }
  return null;
});