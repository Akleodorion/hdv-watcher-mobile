import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hdv_watcher/features/item/presentation/pages/item_show/sections/chart_filter_section.dart';
import 'package:hdv_watcher/features/item/presentation/pages/item_show/sections/chart_section.dart';
import 'package:hdv_watcher/features/item/presentation/pages/item_show/sections/current_price_section.dart';
import 'package:hdv_watcher/features/item/presentation/pages/item_show/sections/general_section.dart';
import 'package:hdv_watcher/features/item/presentation/pages/item_show/sections/selling_price_section.dart';
import 'package:hdv_watcher/features/item/presentation/providers/items/providers/fetch_item_provider.dart';
import 'package:intl/intl.dart';

import '../../../../domain/entitie/item.dart';
import '../../../providers/items/state/fetch_item_state.dart';

class ItemShowPageLayout extends StatelessWidget {
  const ItemShowPageLayout({super.key, required this.item});
  final Item item;

  Future<FetchItemState> fetchItemState({required WidgetRef ref}) async {
    final state = ref.watch(fetchItemProvider);
    return state;
  }

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
              data: item.superPrice.currentPrice,
            ),
            const SizedBox(
              height: 20,
            ),
            ChartFilterSection(
              data: item.superPrice.currentPrice,
            ),
            const SizedBox(
              height: 20,
            ),
            SellingPriceSection(
              averagePrice: item.superPrice.averageSellingPrice,
              medianPrice: item.superPrice.recommandedSellingPrice,
            ),
            const SizedBox(
              height: 20,
            ),
            ChartSection(
              mapData: item.priceList,
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                "Date de scrapping: ${DateFormat.yMMMEd().format(item.superPrice.unitPrices.prices.last.scrapDate)}",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
