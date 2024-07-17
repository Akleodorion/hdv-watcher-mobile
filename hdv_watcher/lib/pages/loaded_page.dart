import 'package:flutter/material.dart';
import 'package:hdv_watcher/general_widgets/pet_ressource_card/pet_ressource_card.dart';
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
    final items = widget.xpList.sortedList;
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
            width: 400,
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, count) {
                return PetRessourceCard(
                  item: items[count],
                  croquette: widget.xpList.croquettes,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
