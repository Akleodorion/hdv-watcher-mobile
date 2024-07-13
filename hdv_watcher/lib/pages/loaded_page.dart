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
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 77, 81, 152),
                      image: DecorationImage(
                          image:
                              NetworkImage(widget.xpList.items[225].imgUrl))),
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
                        Text(widget.xpList.items[225].name,
                            style: TextStyle(fontSize: 10)),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          widget.xpList.items[225].ressourceType,
                          style: TextStyle(fontSize: 10),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "xp par unité: ${widget.xpList.items[225].fXp.toString()}",
                          style: const TextStyle(fontSize: 12),
                        ),
                        Text(
                          "prix: ${widget.xpList.items[225].betterPrice.toString()}",
                          style: const TextStyle(fontSize: 12),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 77, 152, 93)),
                  width: 200,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          "Qty for 100%: ${widget.xpList.items[225].quantityFor100Xp.floor()}",
                          style: const TextStyle(fontSize: 12),
                        ),
                        Text(
                          "Price for 100%: ${(widget.xpList.items[225].quantityFor100Xp * widget.xpList.items[225].betterPrice).floor()}",
                          style: const TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
