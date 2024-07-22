import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hdv_watcher/core/enums/price_type.dart';
import 'package:hdv_watcher/features/item/presentation/pages/item_show/components/info_container.dart';
import 'package:hdv_watcher/features/item/presentation/providers/chart_filter/chart_filter_provider.dart';

class SellingPriceSection extends ConsumerWidget {
  const SellingPriceSection(
      {super.key, required this.averagePrice, required this.medianPrice});

  final Map<PriceType, int> averagePrice;
  final Map<PriceType, int> medianPrice;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activePriceType = ref.watch(activeChartFilterProvider);
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InfoContainer(
            content: "avg price: ${averagePrice[activePriceType]} Kamas"),
        InfoContainer(
            content: "rec price: ${medianPrice[activePriceType]} Kamas"),
      ],
    );
  }
}
