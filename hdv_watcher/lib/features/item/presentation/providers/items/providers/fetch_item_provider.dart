import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hdv_watcher/features/item/domain/usecase/fetch_item_usecase.dart';
import 'package:hdv_watcher/features/item/presentation/providers/items/notifiers/fetch_item_notifier.dart';
import 'package:hdv_watcher/features/item/presentation/providers/items/state/fetch_item_state.dart';

import '../../../../../../injection_container.dart';

final itemsListProvider =
    StateNotifierProvider<FetchItemNotifier, FetchItemState>((ref) {
  final FetchItemUsecase fetchItemUsecase = sl<FetchItemUsecase>();
  return FetchItemNotifier(fetchItemsUsecase: fetchItemUsecase);
});
