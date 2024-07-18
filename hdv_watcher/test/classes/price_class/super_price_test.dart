import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:hdv_watcher/classes/price_class/super_price.dart';

import '../../fixtures/fixture_reader.dart';

void main() {
  group("fromJson", () {
    test('should return a valid SuperPrice model', () async {
      //arrange
      final jsonData = json.decode(fixture("item.json"));
      //act
      final result = SuperPrice.fromJson(json: jsonData);
      //assert
      expect(result, isA<SuperPrice>());
    });
  });
}
