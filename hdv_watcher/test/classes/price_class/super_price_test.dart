import 'package:flutter_test/flutter_test.dart';
import 'package:hdv_watcher/core/classes/super_price.dart';

import '../../test_data/dates.dart';
import '../../test_data/prices.dart';
import '../../test_data/values.dart';

void main() {
  group("SuperPricefromJson", () {
    final SuperPrice tSuperPrice = SuperPrice(
      unitPrices: tUnitPrice,
      tenthPrice: tTenthPrice,
      hundredPrice: tHundredPrice,
    );

    test('should return a valid SuperPrice model', () async {
      //act
      final SuperPrice result = SuperPrice.fromItemFactory(
          unitPrices: tUnits,
          tenthPrices: tTenths,
          hundredPrices: tHundreds,
          dates: tDates);
      //assert
      expect(result, tSuperPrice);
    });
  });
}
