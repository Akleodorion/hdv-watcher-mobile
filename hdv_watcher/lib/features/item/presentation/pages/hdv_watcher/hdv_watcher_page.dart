import 'package:flutter/material.dart';
import 'package:hdv_watcher/features/item/presentation/pages/hdv_watcher/sections/filter_section.dart';
import 'package:hdv_watcher/features/item/presentation/pages/hdv_watcher/sections/list_section/list_section.dart';
import 'package:hdv_watcher/features/item/presentation/pages/hdv_watcher/sections/title_section.dart';

class HdvWatcherPage extends StatelessWidget {
  const HdvWatcherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Column(
          children: [
            const TitleSection(),
            const SizedBox(
              height: 20,
            ),
            const FilterSection(),
            const SizedBox(
              height: 20,
            ),
            const ListSection(),
          ],
        ),
      ),
    );
  }
}
