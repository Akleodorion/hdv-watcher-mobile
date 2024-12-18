import 'package:flutter/material.dart';
import 'package:hdv_watcher/core/enums/price_type.dart';
import 'package:hdv_watcher/features/item/presentation/pages/item_show/components/info_container.dart';

class CurrentPriceSection extends StatelessWidget {
  const CurrentPriceSection({super.key, required this.data});

  final Map<PriceType, int> data;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        for (final priceType in PRICETYPES)
          InfoContainer(
            description: priceType.name,
            content: data[priceType] != 0
                ? "${data[priceType].toString()} K"
                : "Pas en vente",
          ),
      ],
    );
  }
}
