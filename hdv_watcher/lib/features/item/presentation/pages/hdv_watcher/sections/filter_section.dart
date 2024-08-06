import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hdv_watcher/core/enums/price_type.dart';
import 'package:hdv_watcher/core/widgets/buttons/filter_button.dart';
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
            builder: (context, ref, child) {
              final stateMap = ref.watch(priceTypeFilterProvider);
              return FilterButton(
                title: priceType.name,
                isActivated: stateMap[priceType]!,
                onTap: () {
                  ref
                      .read(priceTypeFilterProvider.notifier)
                      .toggleFilter(priceType);
                },
              );
            },
          ),
      ],
    );
  }
}
