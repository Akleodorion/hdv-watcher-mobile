import 'package:flutter/material.dart';

class InfoContainer extends StatelessWidget {
  const InfoContainer(
      {super.key, required this.content, required this.description});
  final String description;
  final String content;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: const Color.fromARGB(255, 165, 186, 195),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Center(
          child: Column(
            children: [
              Text(
                description,
                style: const TextStyle(fontSize: 12),
              ),
              Text(
                content,
                style: const TextStyle(fontSize: 12),
              )
            ],
          ),
        ),
      ),
    );
  }
}
