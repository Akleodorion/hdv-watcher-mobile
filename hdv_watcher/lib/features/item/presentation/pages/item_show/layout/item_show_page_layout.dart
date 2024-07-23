import 'package:flutter/material.dart';
import 'package:hdv_watcher/features/item/presentation/pages/item_show/sections/chart_filter_section.dart';
import 'package:hdv_watcher/features/item/presentation/pages/item_show/sections/chart_section.dart';
import 'package:hdv_watcher/features/item/presentation/pages/item_show/sections/current_price_section.dart';
import 'package:hdv_watcher/features/item/presentation/pages/item_show/sections/general_section.dart';
import 'package:hdv_watcher/features/item/presentation/pages/item_show/sections/selling_price_section.dart';

import '../../../../domain/entitie/item.dart';

class ItemShowPageLayout extends StatelessWidget {
  const ItemShowPageLayout({super.key, required this.item});

  final Item item;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            GeneralSection(
              url: item.imgUrl,
              ressourceType: item.ressourceType,
            ),
            const SizedBox(
              height: 20,
            ),
            CurrentPriceSection(
              data: item.currentPriceMap,
            ),
            const SizedBox(
              height: 20,
            ),
            ChartFilterSection(
              data: item.currentPriceMap,
            ),
            const SizedBox(
              height: 20,
            ),
            SellingPriceSection(
              averagePrice: item.averageSellingPrice,
              medianPrice: item.recommandedSellingPrice,
            ),
            const SizedBox(
              height: 20,
            ),
            ChartSection(
              mapData: item.priceList,
            ),
          ],
        ),
      ),
    );
  }
}
