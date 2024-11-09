import 'package:collection/collection.dart';

class PricePoint {
  final double x;
  final double y;
  const PricePoint({required this.x, required this.y});
}

List<PricePoint> get pricePoints {
  final data = <double>[2, 4, 6, 8, 11, 13, 2, 6, 7];
  return data
      .mapIndexed(
          (index, element) => PricePoint(x: index.toDouble(), y: element))
      .toList();
}
