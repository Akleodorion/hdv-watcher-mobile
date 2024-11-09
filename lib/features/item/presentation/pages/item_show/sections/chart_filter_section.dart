import 'package:flutter/material.dart';
import 'package:hdv_watcher/core/enums/price_type.dart';
import 'package:hdv_watcher/features/item/presentation/pages/item_show/components/chart_filter_button.dart';

class ChartFilterSection extends StatelessWidget {
  const ChartFilterSection({super.key, required this.data});

  final Map<PriceType, int> data;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        for (final priceType in PRICETYPES)
          ChartFilterButton(
            isActive: data[priceType] != 0 ? true : false,
            title: priceType.name,
            priceType: priceType,
          ),
      ],
    );
  }
}
