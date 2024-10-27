import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hdv_watcher/core/enums/price_type.dart';
import 'package:hdv_watcher/features/item/domain/entitie/item.dart';
import 'package:hdv_watcher/features/item/presentation/providers/items/providers/hundred_items_list_provider.dart';
import 'package:hdv_watcher/features/item/presentation/providers/items/providers/tenth_items_list_provider.dart';
import 'package:hdv_watcher/features/item/presentation/providers/items/providers/unit_items_list_provider.dart';

abstract class NotifierCaller {
  void updateItemFromList({required Item item, required PriceType priceType});
}

class NotifierCallerImpl implements NotifierCaller {
  final WidgetRef ref;

  NotifierCallerImpl({required this.ref});

  @override
  void updateItemFromList({required Item item, required PriceType priceType}) {
    if (priceType == PriceType.unit) {
      ref.read(unitItemsProvider.notifier).updateItemFromList(newItem: item);
    } else if (priceType == PriceType.tenth) {
      ref.read(tenthItemsProvider.notifier).updateItemFromList(newItem: item);
    } else {
      ref.read(hundredItemsProvider.notifier).updateItemFromList(newItem: item);
    }
  }
}
