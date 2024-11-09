import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hdv_watcher/core/enums/price_type.dart';
import 'package:hdv_watcher/features/item/presentation/providers/price_type/state/price_type_filter_notifier.dart';

final priceTypeFilterProvider =
    StateNotifierProvider<PriceTypeFilterNotifier, Map<PriceType, bool>>((ref) {
  return PriceTypeFilterNotifier();
});
