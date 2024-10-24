import 'package:flutter_test/flutter_test.dart';
import 'package:hdv_watcher/core/classes/prices/prices.dart';
import 'package:hdv_watcher/core/enums/price_type.dart';

import '../../test_data/price_test_data.dart';

void main() {
  group("fromJson", () {
    const PriceType priceType = PriceType.unit;

    final Prices tPrices = Prices(
      prices: tPriceList,
      priceType: priceType,
      capitalGain: 520,
      medianPrice: 522,
      currentPrice: 1252,
    );
    test('should return a valid Prices', () async {
      //act
      final result = Prices.fromJson(priceInfoJson: {}, priceType: priceType);
      //assert
      expect(result, tPrices);
    });
  });
}
