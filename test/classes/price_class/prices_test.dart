import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:hdv_watcher/core/classes/prices/price.dart';
import 'package:hdv_watcher/core/classes/prices/prices.dart';
import 'package:hdv_watcher/core/enums/price_type.dart';

import '../../fixtures/fixture_reader.dart';

void main() {
  group("fromJson", () {
    const PriceType priceType = PriceType.unit;
    final tPrice1 = Price(
        priceValue: 220,
        priceType: priceType,
        scrapDate: DateTime.parse("2024-07-14T15:00:00.000+00:00"));
    final tPrice2 = Price(
        priceValue: 221,
        priceType: priceType,
        scrapDate: DateTime.parse("2024-07-14T16:00:00.000+00:00"));
    final tPrice3 = Price(
        priceValue: 219,
        priceType: priceType,
        scrapDate: DateTime.parse("2024-07-14T17:00:00.000+00:00"));
    final tPrice4 = Price(
        priceValue: 223,
        priceType: priceType,
        scrapDate: DateTime.parse("2024-07-14T18:00:00.000+00:00"));
    final tPrice5 = Price(
      priceValue: 218,
      priceType: priceType,
      scrapDate: DateTime.parse("2024-07-14T19:00:00.000+00:00"),
    );
    Map<String, dynamic> jsonData = json.decode(fixture('item.json'));

    Prices tPrices = Prices(
      prices: [tPrice1, tPrice2, tPrice3, tPrice4, tPrice5],
      priceType: priceType,
      capitalGain: 45,
      medianPrice: 191,
      currentPrice: 218,
    );
    test('should return a valid Prices', () async {
      //act
      final result = Prices.fromJson(
          priceInfoJson: jsonData["unit_price_info"], priceType: priceType);
      //assert
      expect(result, tPrices);
    });
  });
}
