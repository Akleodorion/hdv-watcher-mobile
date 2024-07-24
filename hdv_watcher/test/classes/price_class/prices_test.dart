import 'package:flutter_test/flutter_test.dart';
import 'package:hdv_watcher/core/classes/prices/prices.dart';
import 'package:hdv_watcher/core/enums/price_type.dart';

import '../../test_data/dates_test_data.dart';
import '../../test_data/price_test_data.dart';
import '../../test_data/values_test_data.dart';

void main() {
  group("fromSuperPricesFactory", () {
    final List<int> values = tUnits;
    final List<DateTime> dates = tDates;
    const PriceType priceType = PriceType.unit;

    final Prices tPrices = Prices(
      prices: tPriceList,
      priceType: priceType,
    );
    test('should return a valid Prices', () async {
      //act
      final result = Prices.fromSuperPriceFactory(
          values: values, dates: dates, priceType: priceType);
      //assert
      expect(result, tPrices);
    });
  });
}
