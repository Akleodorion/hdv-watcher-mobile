import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hdv_watcher/core/enums/price_type.dart';
import 'package:hdv_watcher/features/item/presentation/providers/chart_filter/state/chart_filter_notifier.dart';

final chartFilterProvider =
    StateNotifierProvider<ChartFilterNotifier, Map<PriceType, bool>>((ref) {
  return ChartFilterNotifier();
});

final activeChartFilterProvider = Provider<PriceType>((ref) {
  final map = ref.watch(chartFilterProvider);

  return map.entries.firstWhere((element) => element.value == true).key;
});
