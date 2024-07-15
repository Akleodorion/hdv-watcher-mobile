import 'package:flutter/material.dart';
import 'package:hdv_watcher/features/item/domain/entities/item.dart';
import 'package:hdv_watcher/obects/classes/items/item_list.dart';
import 'package:hdv_watcher/obects/classes/items/ressource_xp_list.dart';

class LoadedPage extends StatefulWidget {
  const LoadedPage({super.key, required this.itemList, required this.xpList});

  final ItemList itemList;
  final RessourceXpList xpList;

  @override
  State<LoadedPage> createState() => _LoadedPageState();
}

class _LoadedPageState extends State<LoadedPage> {
  var setDisplay = 0;

  @override
  Widget build(BuildContext context) {
    final item = widget.xpList.sortedList;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                onPressed: () {
                  setState(() {
                    setDisplay = 0;
                  });
                },
                child: const Text("Famillier"),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    setDisplay = 1;
                  });
                },
                child: const Text("Ressources"),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 700,
            child: ListView.builder(
              itemCount: item.length,
              itemBuilder: (context, count) {
                return XpRessource(item: item[count]);
              },
            ),
          )
        ],
      ),
    );
  }
}

class XpRessource extends StatelessWidget {
  final Item item;

  const XpRessource({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.black12,
      ),
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: 400,
      height: 125,
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 77, 81, 152),
                image: DecorationImage(image: NetworkImage(item.imgUrl))),
            width: 50,
          ),
          Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 152, 82, 77),
            ),
            width: 150,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(item.name, style: const TextStyle(fontSize: 10)),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    item.ressourceType,
                    style: const TextStyle(fontSize: 10),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "xp par unité: ${item.itemXp}",
                    style: const TextStyle(fontSize: 12),
                  ),
                  Text(
                    "kamas par xp: ${item.kamasPerXp}",
                    style: const TextStyle(fontSize: 12),
                  ),
                  Text(
                    "${item.superPrices.lowerPrice.priceType.name}: ${item.superPrices.lowerPrice.priceValue}",
                    style: const TextStyle(fontSize: 12),
                  )
                ],
              ),
            ),
          ),
          Container(
            decoration:
                const BoxDecoration(color: Color.fromARGB(255, 77, 152, 93)),
            width: 200,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    "Qty for 100%: ${item.qtyFor100Xp}",
                    style: const TextStyle(fontSize: 12),
                  ),
                  Text(
                    "Price for 100%: ${item.totalCost}",
                    style: const TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
