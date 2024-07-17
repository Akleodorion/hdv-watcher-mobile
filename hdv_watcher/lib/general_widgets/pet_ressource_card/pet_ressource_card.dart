import 'package:flutter/material.dart';
import 'package:hdv_watcher/features/item/domain/entities/item.dart';

class PetRessourceCard extends StatelessWidget {
  final Item item;
  final Item croquette;
  const PetRessourceCard(
      {super.key, required this.item, required this.croquette});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 25,
      ),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 136, 109, 107),
      ),
      height: 150,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: 50,
            decoration: BoxDecoration(border: Border.all(), color: Colors.blue),
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage(item.imgUrl))),
            ),
          ),
          // Information sur l'objet
          Container(
            width: 175,
            decoration: BoxDecoration(
              border: Border.all(),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 3,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: const TextStyle(fontSize: 12),
                  ),
                  Text(
                    "Ressource: ${item.ressourceType}",
                    style: const TextStyle(fontSize: 12),
                  ),
                  Text(
                    "Xp par item: ${item.itemXp}",
                    style: const TextStyle(fontSize: 12),
                  ),
                  Text(
                    "Kamas par xp: ${item.kamasPerXp}",
                    style: const TextStyle(fontSize: 12),
                  ),
                  Text(
                    "${item.superPrices.lowerPriceString} K",
                    style: const TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 175,
            decoration: BoxDecoration(
              border: Border.all(),
            ),
            child: Column(
              children: [
                Text(item.qtyFor100XpString),
                Text(item.totalCostString),
                Text("K/Xp de ref: ${croquette.kamasPerXp}"),
                Text(croquette.totalCostString)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
