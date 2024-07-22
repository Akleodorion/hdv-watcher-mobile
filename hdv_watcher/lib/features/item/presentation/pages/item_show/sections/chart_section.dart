import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hdv_watcher/core/classes/prices/price.dart';
import 'package:hdv_watcher/core/enums/price_type.dart';
import 'package:intl/intl.dart';

import '../../../providers/chart_filter/chart_filter_provider.dart';

class ChartSection extends ConsumerWidget {
  const ChartSection({super.key, required this.mapData});

  final Map<PriceType, List<Price>> mapData;

  double getInterval(List<Price> prices) {
    // Calculer l'intervalle pour les titres à gauche en fonction de vos données
    final maxValue =
        prices.map((price) => price.priceValue).reduce((a, b) => a > b ? a : b);
    return maxValue / 5;
  }

  double getMaxY(List<Price> prices) {
    return prices
            .map((price) => price.priceValue)
            .reduce((a, b) => a > b ? a : b)
            .toDouble() *
        1.2;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activePriceType = ref.watch(activeChartFilterProvider);
    final List<Price> prices = mapData[activePriceType]!;
    return AspectRatio(
      aspectRatio: 1,
      child: LineChart(
        LineChartData(
          minY: 0,
          maxY: getMaxY(prices),
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                reservedSize: 40,
                interval: getInterval(prices),
                showTitles: true,
              ),
            ),
            rightTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            topTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  final date =
                      DateTime.fromMillisecondsSinceEpoch(value.toInt());
                  final formattedDate = DateFormat("MM/dd").format(date);
                  return SideTitleWidget(
                    angle: 12,
                    axisSide: meta.axisSide,
                    space: 5,
                    child: Text(formattedDate),
                  );
                },
              ),
            ),
          ),
          borderData: FlBorderData(show: true),
          gridData: const FlGridData(show: true),
          lineBarsData: [
            LineChartBarData(
              spots: prices
                  .map(
                    (price) => FlSpot(
                      price.scrapDate.millisecondsSinceEpoch.toDouble(),
                      price.priceValue.toDouble(),
                    ),
                  )
                  .toList(),
              isCurved: true,
              color: Colors.blue,
              dotData: const FlDotData(show: false),
            ),
          ],
        ),
      ),
    );
  }
}
