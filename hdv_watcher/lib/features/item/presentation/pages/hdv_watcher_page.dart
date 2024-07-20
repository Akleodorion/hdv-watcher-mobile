import 'package:flutter/material.dart';

class HdvWatcherPage extends StatelessWidget {
  const HdvWatcherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 20, left: 8, right: 8),
        child: Column(
          children: [
            const Center(
              child: Text("HDV WATCHER"),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                  onPressed: () {},
                  child: const Text("Unit"),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("Tenth"),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("Hundred"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
