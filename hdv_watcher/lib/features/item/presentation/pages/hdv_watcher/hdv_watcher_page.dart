import 'package:flutter/material.dart';
import 'package:hdv_watcher/features/item/presentation/pages/hdv_watcher/sections/filter_section.dart';
import 'package:hdv_watcher/features/item/presentation/pages/hdv_watcher/sections/title_section.dart';

class HdvWatcherPage extends StatelessWidget {
  const HdvWatcherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.only(top: 20, left: 8, right: 8),
        child: Column(
          children: [
            TitleSection(),
            SizedBox(
              height: 20,
            ),
            FilterSection(),
          ],
        ),
      ),
    );
  }
}
