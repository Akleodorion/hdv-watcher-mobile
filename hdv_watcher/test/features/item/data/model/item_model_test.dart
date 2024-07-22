import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:hdv_watcher/core/classes/prices/price.dart';
import 'package:hdv_watcher/core/classes/prices/prices.dart';
import 'package:hdv_watcher/core/classes/prices/super_price.dart';
import 'package:hdv_watcher/core/enums/price_type.dart';
import 'package:hdv_watcher/core/enums/ressource_type.dart';
import 'package:hdv_watcher/core/utils/array_utils.dart';
import 'package:hdv_watcher/core/utils/dates_utils.dart';
import 'package:hdv_watcher/features/item/data/model/item_model.dart';
import 'package:hdv_watcher/features/item/domain/entitie/item.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../fixtures/fixture_reader.dart';
import 'item_model_test.mocks.dart';

@GenerateMocks([ArrayUtils, DatesUtils])
void main() {
  late MockArrayUtils mockArrayUtils;
  late MockDatesUtils mockDatesUtils;

  setUp(() {
    mockArrayUtils = MockArrayUtils();
    mockDatesUtils = MockDatesUtils();
  });

  group("fromJson", () {
    final Item item1 = ItemModel(
      id: 10250,
      name: "Œil de Crowneille",
      imgUrl: "https://api.dofusdb.fr/img/items/109326.png",
      ressourceType: RessourceType.oeil,
      petXp: 1,
      quantityForUnitXp: 1,
      superPrice: SuperPrice(
        unitPrices: Prices(prices: [
          Price(
              priceValue: 125,
              priceType: PriceType.unit,
              scrapDate: DateTime.parse("2024-07-14T15:02:34.954+00:00")),
          Price(
              priceValue: 125,
              priceType: PriceType.unit,
              scrapDate: DateTime.parse("2024-07-14T17:02:31.617+00:00")),
          Price(
              priceValue: 147,
              priceType: PriceType.unit,
              scrapDate: DateTime.parse("2024-07-14T18:02:34.031+00:00")),
          Price(
              priceValue: 158,
              priceType: PriceType.unit,
              scrapDate: DateTime.parse("2024-07-14T20:02:36.610+00:00")),
          Price(
              priceValue: 123,
              priceType: PriceType.unit,
              scrapDate: DateTime.parse("2024-07-14T22:02:34.727+00:00")),
        ], priceType: PriceType.unit),
        tenthPrices: Prices(prices: [
          Price(
              priceValue: 1257,
              priceType: PriceType.tenth,
              scrapDate: DateTime.parse("2024-07-14T15:02:34.954+00:00")),
          Price(
              priceValue: 1257,
              priceType: PriceType.tenth,
              scrapDate: DateTime.parse("2024-07-14T17:02:31.617+00:00")),
          Price(
              priceValue: 1236,
              priceType: PriceType.tenth,
              scrapDate: DateTime.parse("2024-07-14T18:02:34.031+00:00")),
          Price(
              priceValue: 1356,
              priceType: PriceType.tenth,
              scrapDate: DateTime.parse("2024-07-14T20:02:36.610+00:00")),
          Price(
              priceValue: 1554,
              priceType: PriceType.tenth,
              scrapDate: DateTime.parse("2024-07-14T22:02:34.727+00:00")),
        ], priceType: PriceType.tenth),
        hundredPrices: Prices(prices: [
          Price(
              priceValue: 12458,
              priceType: PriceType.hundred,
              scrapDate: DateTime.parse("2024-07-14T15:02:34.954+00:00")),
          Price(
              priceValue: 12650,
              priceType: PriceType.hundred,
              scrapDate: DateTime.parse("2024-07-14T17:02:31.617+00:00")),
          Price(
              priceValue: 12385,
              priceType: PriceType.hundred,
              scrapDate: DateTime.parse("2024-07-14T18:02:34.031+00:00")),
          Price(
              priceValue: 14523,
              priceType: PriceType.hundred,
              scrapDate: DateTime.parse("2024-07-14T20:02:36.610+00:00")),
          Price(
              priceValue: 13256,
              priceType: PriceType.hundred,
              scrapDate: DateTime.parse("2024-07-14T22:02:34.727+00:00")),
        ], priceType: PriceType.hundred),
      ),
    );

    final List<DateTime> dates = [
      DateTime.parse("2024-07-14T15:02:34.954+00:00"),
      DateTime.parse("2024-07-14T17:02:31.617+00:00"),
      DateTime.parse("2024-07-14T18:02:34.031+00:00"),
      DateTime.parse("2024-07-14T20:02:36.610+00:00"),
      DateTime.parse("2024-07-14T22:02:34.727+00:00")
    ];
    final List<int> unit = [125, 125, 147, 158, 123];
    final List<int> tenth = [1257, 1257, 1236, 1356, 1554];
    final List<int> hundred = [12458, 12650, 12385, 14523, 13256];

    test('should return a valid Item Model', () async {
      //arrange
      final Map<String, dynamic> jsonMap = json.decode(fixture('item.json'));
      when(mockDatesUtils.dateListParser(values: anyNamed('values')))
          .thenReturn(dates);
      when(mockArrayUtils.getIntsFromArray(unit))
          .thenReturn([125, 125, 147, 158, 123]);
      when(mockArrayUtils.getIntsFromArray(tenth))
          .thenReturn([1257, 1257, 1236, 1356, 1554]);
      when(mockArrayUtils.getIntsFromArray(hundred))
          .thenReturn([12458, 12650, 12385, 14523, 13256]);
      //act
      final ItemModel result = ItemModel.fromJson(
        json: jsonMap,
        datesUtils: mockDatesUtils,
        arrayUtils: mockArrayUtils,
      );
      //assert
      expect(result, item1);
    });
  });
}
