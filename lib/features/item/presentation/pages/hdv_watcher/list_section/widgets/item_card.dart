import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hdv_watcher/core/enums/price_type.dart';
import 'package:hdv_watcher/core/enums/ressource_type.dart';
import 'package:hdv_watcher/core/utils/notifier_caller.dart';
import 'package:hdv_watcher/features/item/domain/entitie/item.dart';
import 'package:hdv_watcher/features/item/presentation/pages/item_show/item_show_page.dart';
import 'package:hdv_watcher/features/item/presentation/providers/chart_filter/chart_filter_provider.dart';
import 'package:hdv_watcher/features/item/presentation/providers/items/providers/fetch_item_provider.dart';

class ItemCard extends ConsumerWidget {
  const ItemCard({super.key, required this.item, required this.priceType});

  final Item item;
  final PriceType priceType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final NotifierCaller notifier = NotifierCallerImpl(ref: ref);

    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
      ),
      height: 100,
      child: InkWell(
        onTap: () {
          ref.read(chartFilterProvider.notifier).toggleFilter(priceType);
          if (item.isLoaded) {
            ref.read(fetchItemProvider.notifier).setStateToLoaded(item: item);
          } else {
            ref.read(fetchItemProvider.notifier).fetchItem(
                item: item, notifier: notifier, priceType: priceType);
          }

          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return ItemShowPage(item: item);
              },
            ),
          );
        },
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage(item.imgUrl)),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Center(
                      child: Text(
                        textAlign: TextAlign.center,
                        item.name,
                      ),
                    ),
                    Text(
                        textAlign: TextAlign.center,
                        RESSOURCE_DATA[item.ressourceType] ?? "unknown"),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          "Prix d'achat: ${item.superPrice.currentPrice[priceType]} k"),
                      Text(
                          "Prix de vente: ${item.superPrice.recommandedSellingPrice[priceType]} k"),
                      Text(
                          "Plus value: ${item.superPrice.capitalGain[priceType]} k")
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
