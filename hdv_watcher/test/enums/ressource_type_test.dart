import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:hdv_watcher/core/enums/ressource_type.dart';
import '../fixtures/fixture_reader.dart';

void main() {
  test(
    'should return a valid ressourceEnum',
    () async {
      final Map<String, dynamic> jsonData = json.decode(fixture("item.json"));
      //act
      final result = ressourceTypeFromJson(json: jsonData["item"]);
      //assert
      expect(result, RessourceType.oeil);
    },
  );
}
