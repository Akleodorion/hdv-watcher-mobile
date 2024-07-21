import 'package:flutter/material.dart';

class MyBottomNavigationBar extends StatelessWidget {
  const MyBottomNavigationBar(
      {super.key, required this.onTap, required this.index});

  final void Function(int value) onTap;
  final int index;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.grey,
      currentIndex: index,
      onTap: (value) {
        onTap(value);
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.currency_exchange),
          label: "Graph",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.pets),
          label: 'Famillier',
        ),
      ],
    );
  }
}
