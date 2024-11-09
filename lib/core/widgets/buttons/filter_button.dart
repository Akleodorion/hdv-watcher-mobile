import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FilterButton extends ConsumerWidget {
  const FilterButton({
    super.key,
    required this.title,
    required this.onTap,
    required this.isActivated,
  });

  final String title;
  final bool isActivated;

  final void Function() onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isActivated
              ? const Color.fromARGB(187, 227, 200, 118)
              : const Color.fromARGB(163, 226, 223, 223),
          borderRadius: BorderRadius.circular(10),
        ),
        width: 110,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
          ),
          child: Center(
            child: Text(
              title,
              style: const TextStyle(fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}
