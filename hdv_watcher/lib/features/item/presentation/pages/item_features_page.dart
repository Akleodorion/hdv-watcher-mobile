import 'package:flutter/material.dart';
import 'package:hdv_watcher/features/item/presentation/pages/hdv_watcher_page.dart';

class ItemFeaturesPage extends StatefulWidget {
  const ItemFeaturesPage({super.key});

  @override
  State<ItemFeaturesPage> createState() => _ItemFeaturesPageState();
}

class _ItemFeaturesPageState extends State<ItemFeaturesPage> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _currentIndex == 0 ? const HdvWatcherPage() : null,
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.grey,
          currentIndex: _currentIndex,
          onTap: (value) {
            setState(() {
              _currentIndex = value;
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.currency_exchange), label: "Graph"),
            BottomNavigationBarItem(icon: Icon(Icons.pets), label: 'Famillier'),
          ],
        ));
  }
}
