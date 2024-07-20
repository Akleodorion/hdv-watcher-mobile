import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hdv_watcher/features/item/domain/usecase/fetch_items_usecase.dart';
import 'package:hdv_watcher/features/item/presentation/providers/state/item_notifier.dart';
import 'package:hdv_watcher/features/item/presentation/providers/state/item_state.dart';

import '../../../../injection_container.dart';

final itemProvider = StateNotifierProvider<ItemNotifier, ItemState>((ref) {
  final FetchItemsUsecase fetchItemsUsecase = sl<FetchItemsUsecase>();

  return ItemNotifier(fetchItemsUsecase: fetchItemsUsecase);
});
