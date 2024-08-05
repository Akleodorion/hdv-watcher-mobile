import 'package:flutter/material.dart';

class ItemListLoadingPage extends StatelessWidget {
  const ItemListLoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 50),
      child: Column(
        children: [
          Center(
            child: CircularProgressIndicator(),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "récupérations des données des objets",
            style: TextStyle(fontSize: 18),
          )
        ],
      ),
    );
  }
}
