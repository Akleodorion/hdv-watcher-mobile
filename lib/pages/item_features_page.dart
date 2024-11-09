import 'package:flutter/material.dart';
import 'package:hdv_watcher/features/item/presentation/pages/hdv_watcher/hdv_watcher_page.dart';

class ItemFeaturesPage extends StatefulWidget {
  const ItemFeaturesPage({super.key});

  @override
  State<ItemFeaturesPage> createState() => _ItemFeaturesPageState();
}

class _ItemFeaturesPageState extends State<ItemFeaturesPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HdvWatcherPage(),
    );
  }
}
