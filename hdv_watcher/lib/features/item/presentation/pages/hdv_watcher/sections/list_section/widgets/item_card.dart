import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hdv_watcher/core/enums/price_type.dart';
import 'package:hdv_watcher/core/enums/ressource_type.dart';
import 'package:hdv_watcher/features/item/domain/entitie/item.dart';
import 'package:hdv_watcher/features/item/presentation/pages/item_show/item_show_page.dart';
import 'package:hdv_watcher/features/item/presentation/providers/chart_filter/chart_filter_provider.dart';

class ItemCard extends ConsumerWidget {
  const ItemCard({super.key, required this.item, required this.priceType});

  final Item item;
  final PriceType priceType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (BuildContext context) {
            return ItemShowPage(item: item);
          }));
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Prix d'achat: ${item.currentPriceMap[priceType]} k"),
                    Text(
                        "Prix de vente:${item.recommandedSellingPrice[priceType]} k")
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
