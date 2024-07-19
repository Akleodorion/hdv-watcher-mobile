import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:hdv_watcher/core/classes/super_price.dart';

import '../../fixtures/fixture_reader.dart';

void main() {
  group("SuperPricefromJson", () {
    test('should return a valid SuperPrice model', () async {
      //arrange
      final jsonData = json.decode(fixture("item.json"));
      //act
      // final result = SuperPrice(json: jsonData);
      //assert
      // expect(result, isA<SuperPrice>());
    });
  });
}
