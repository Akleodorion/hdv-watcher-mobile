import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hdv_watcher/features/item/presentation/pages/hdv_watcher/list_section/functions/retrieve_item_list.dart';
import 'package:hdv_watcher/features/item/presentation/pages/hdv_watcher/list_section/functions/routing.dart';
import 'package:hdv_watcher/features/item/presentation/providers/price_type/price_type_filter_provider.dart';

class ListSection extends ConsumerStatefulWidget {
  const ListSection({super.key});

  @override
  ConsumerState<ListSection> createState() => _ListSectionState();
}

class _ListSectionState extends ConsumerState<ListSection> {
  @override
  Widget build(BuildContext context) {
    final filterState = ref.watch(priceTypeFilterProvider);
    final priceType = retrieveActiveFilterKey(filterState);

    return routing(priceType);
  }
}
