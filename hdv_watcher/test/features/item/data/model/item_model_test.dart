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

@GenerateMocks([ArrayUtils, DatesUtils])
void main() {
  setUp(() {});

  group("fromJson", () {
    final Map<String, dynamic> jsonMap = json.decode(fixture('item.json'));
    final Item item1 = ItemModel(
      id: jsonMap["id"],
      name: jsonMap["name"],
      imgUrl: jsonMap["img_url"],
      ressourceType: ressourceFromString(name: jsonMap["ressource_type"]),
      superPrice: SuperPrice.fromJson(
        unitPricesInfoJson: jsonMap["unit_price_info"],
        tenthPricesInfoJson: jsonMap["tenth_price_info"],
        hundredPricesInfoJson: jsonMap["hundred_price_info"],
      ),
      isLoaded: true,
    );

    test('should return a valid Item Model', () async {
      //act
      final ItemModel result =
          ItemModel.fromJson(json: jsonMap, isLoaded: true);
      //assert
      expect(result, item1);
    });
  });
}
