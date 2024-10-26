import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:hdv_watcher/core/classes/prices/prices.dart';
import 'package:hdv_watcher/core/classes/prices/super_price.dart';
import 'package:hdv_watcher/core/enums/price_type.dart';

import '../../fixtures/fixture_reader.dart';

void main() {
  group("fromJson", () {
    Map<String, dynamic> jsonData = json.decode(fixture('item.json'));

    final SuperPrice tSuperPrice = SuperPrice(
      unitPrices: Prices.fromJson(
          priceInfoJson: jsonData["unit_price_info"],
          priceType: PriceType.unit),
      tenthPrices: Prices.fromJson(
          priceInfoJson: jsonData["tenth_price_info"],
          priceType: PriceType.tenth),
      hundredPrices: Prices.fromJson(
          priceInfoJson: jsonData["hundred_price_info"],
          priceType: PriceType.hundred),
    );

    test('should return a valid SuperPrice model', () async {
      //act
      final SuperPrice result = SuperPrice.fromJson(
        unitPricesInfoJson: jsonData["unit_price_info"],
        tenthPricesInfoJson: jsonData["tenth_price_info"],
        hundredPricesInfoJson: jsonData["hundred_price_info"],
      );
      //assert
      expect(result, tSuperPrice);
    });
  });
}
