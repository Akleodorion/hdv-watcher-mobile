import 'package:flutter/material.dart';
import 'package:hdv_watcher/core/enums/price_type.dart';
import 'package:hdv_watcher/widgets/components/filter_button.dart';

class FilterSection extends StatelessWidget {
  const FilterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        for (final priceType in PRICETYPES)
          FilterButton(
            title: priceType.name,
            priceType: priceType,
          ),
      ],
    );
  }
}
