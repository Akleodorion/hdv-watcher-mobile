import 'package:flutter_test/flutter_test.dart';
import 'package:hdv_watcher/core/classes/prices.dart';
import 'package:hdv_watcher/core/enums/price_type.dart';

import '../../test_data/dates.dart';
import '../../test_data/price.dart';
import '../../test_data/values.dart';

void main() {
  group("fromSuperPricesFactory", () {
    final List<int> values = tUnits;
    final List<DateTime> dates = tDates;
    const PriceType priceType = PriceType.unitPrice;

    final Prices tPrices = Prices(prices: tPriceList, priceType: priceType);
    test('should return a valid Prices', () async {
      //arrange

      //act
      final result = Prices.fromSuperPriceFactory(
          values: values, dates: dates, priceType: priceType);
      //assert
      expect(result, tPrices);
    });
  });
}
