import 'package:flutter/material.dart';
import 'package:hdv_watcher/core/enums/price_type.dart';
import 'package:hdv_watcher/core/enums/ressource_type.dart';
import 'package:hdv_watcher/features/item/domain/entitie/item.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({super.key, required this.item, required this.priceType});

  final Item item;
  final PriceType priceType;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
      ),
      height: 100,
      child: InkWell(
        onTap: () {},
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
