import 'package:flutter/material.dart';

class ItemFeaturesPage extends StatefulWidget {
  const ItemFeaturesPage({super.key});

  @override
  State<ItemFeaturesPage> createState() => _ItemFeaturesPageState();
}

class _ItemFeaturesPageState extends State<ItemFeaturesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.currency_exchange), label: "Graph"),
        BottomNavigationBarItem(icon: Icon(Icons.pets), label: 'Famillier'),
      ],
    ));
  }
}
