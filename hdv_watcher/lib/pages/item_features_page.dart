import 'package:flutter/material.dart';
import 'package:hdv_watcher/features/item/presentation/pages/hdv_watcher/hdv_watcher_page.dart';
import 'package:hdv_watcher/pages/widgets/my_bottom_navigation_bar.dart';

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

  void setIndex(value) {
    setState(() {
      _currentIndex = value;
    });
  }

  final List bodyContent = [
    const HdvWatcherPage(),
    null,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bodyContent[_currentIndex],
      bottomNavigationBar: MyBottomNavigationBar(
        onTap: setIndex,
        index: _currentIndex,
      ),
    );
  }
}