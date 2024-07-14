import 'package:flutter/material.dart';
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
          Container(
            decoration: const BoxDecoration(
              color: Colors.black12,
            ),
            width: 400,
            height: 125,
            child: Text("${widget.itemList.items.length}"),
            // child: Row(
            //   children: [
            //     Container(
            //       decoration: BoxDecoration(
            //           color: const Color.fromARGB(255, 77, 81, 152),
            //           image: DecorationImage(image: NetworkImage(item.imgUrl))),
            //       width: 50,
            //     ),
            //     Container(
            //       decoration: const BoxDecoration(
            //         color: Color.fromARGB(255, 152, 82, 77),
            //       ),
            //       width: 150,
            //       child: Padding(
            //         padding: const EdgeInsets.all(8.0),
            //         child: Column(
            //           children: [
            //             Text(item.name, style: const TextStyle(fontSize: 10)),
            //             const SizedBox(
            //               height: 5,
            //             ),
            //             Text(
            //               item.ressourceType,
            //               style: const TextStyle(fontSize: 10),
            //             ),
            //             const SizedBox(
            //               height: 5,
            //             ),
            //             Text(
            //               "xp par unité: ${item.fXp.toString()}",
            //               style: const TextStyle(fontSize: 12),
            //             ),
            //             Text(
            //               "${item.betterPrice["name"]}: ${item.betterPrice["price"].toString()}",
            //               style: const TextStyle(fontSize: 12),
            //             )
            //           ],
            //         ),
            //       ),
            //     ),
            //     Container(
            //       decoration: const BoxDecoration(
            //           color: Color.fromARGB(255, 77, 152, 93)),
            //       width: 200,
            //       child: Padding(
            //         padding: const EdgeInsets.all(8.0),
            //         child: Column(
            //           children: [
            //             Text(
            //               "Qty for 100%: ${item.quantityFor100Xp.floor()}",
            //               style: const TextStyle(fontSize: 12),
            //             ),
            //             Text(
            //               "Price for 100%: ${item.priceToFullXp}",
            //               style: const TextStyle(fontSize: 12),
            //             ),
            //           ],
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
          ),
        ],
      ),
    );
  }
}
