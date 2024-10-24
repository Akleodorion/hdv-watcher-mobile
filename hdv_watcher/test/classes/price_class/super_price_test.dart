import 'package:flutter_test/flutter_test.dart';
import 'package:hdv_watcher/core/classes/prices/super_price.dart';

import '../../test_data/dates_test_data.dart';
import '../../test_data/prices_test_data.dart';
import '../../test_data/values_test_data.dart';

void main() {
  group("SuperPricefromJson", () {
    final SuperPrice tSuperPrice = SuperPrice(
      unitPrices: tUnitPrice,
      tenthPrices: tTenthPrice,
      hundredPrices: tHundredPrice,
    );

    test('should return a valid SuperPrice model', () async {
      //act
      final SuperPrice result = SuperPrice.fromJson(
        unitPricesInfoJson: {},
        tenthPricesInfoJson: {},
        hundredPricesInfoJson: {},
      );
      //assert
      expect(result, tSuperPrice);
    });
  });
}
