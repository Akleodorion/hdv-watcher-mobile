import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hdv_watcher/core/enums/price_type.dart';

final Map<PriceType, bool> initialFilter = {
  PriceType.unit: true,
  PriceType.tenth: false,
  PriceType.hundred: false,
};

class PriceTypeFilterNotifier extends StateNotifier<Map<PriceType, bool>> {
  PriceTypeFilterNotifier() : super(initialFilter);

  void toggleFilter(PriceType type) {
    state.updateAll((key, value) => value = false);
    state = {...state, type: !state[type]!};
  }
}
