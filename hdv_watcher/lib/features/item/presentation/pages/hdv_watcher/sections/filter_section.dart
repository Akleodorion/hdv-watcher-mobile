import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hdv_watcher/core/enums/price_type.dart';
import 'package:hdv_watcher/features/item/presentation/providers/price_type/price_type_filter_provider.dart';

class FilterSection extends StatelessWidget {
  const FilterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        for (final priceType in PRICETYPES)
          Consumer(
            builder: (BuildContext context, ref, child) {
              final filterState = ref.watch(priceTypeFilterProvider);
              return ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: filterState[priceType] == true
                        ? Colors.amber
                        : Colors.black12),
                onPressed: () {
                  ref
                      .read(priceTypeFilterProvider.notifier)
                      .toggleFilter(priceType);
                },
                child: Text(priceType.name),
              );
            },
          ),
      ],
    );
  }
}
