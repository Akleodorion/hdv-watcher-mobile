import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hdv_watcher/features/item/presentation/providers/price_type/price_type_filter_provider.dart';

import '../../core/enums/price_type.dart';

class FilterButton extends ConsumerWidget {
  const FilterButton({
    super.key,
    required this.title,
    required this.priceType,
  });

  final String title;
  final PriceType priceType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterState = ref.watch(priceTypeFilterProvider);
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
          color: filterState[priceType]!
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
      onTap: () {
        ref.read(priceTypeFilterProvider.notifier).toggleFilter(priceType);
      },
    );
  }
}
