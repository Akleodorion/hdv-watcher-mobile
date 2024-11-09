import 'package:flutter/material.dart';
import 'package:hdv_watcher/core/enums/ressource_type.dart';

class GeneralSection extends StatelessWidget {
  const GeneralSection(
      {super.key, required this.url, required this.ressourceType});

  final String url;
  final RessourceType ressourceType;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: NetworkImage(url)),
          ),
          height: 50,
          width: 50,
        ),
        Text(
          "Type: ${RESSOURCE_DATA[ressourceType]}",
          style: const TextStyle(fontSize: 16),
        )
      ],
    );
  }
}
