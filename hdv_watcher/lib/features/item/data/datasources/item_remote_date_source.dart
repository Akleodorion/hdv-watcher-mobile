import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hdv_watcher/core/errors/exceptions.dart';
import 'package:hdv_watcher/core/utils/array_utils.dart';
import 'package:hdv_watcher/core/utils/dates_utils.dart';
import 'package:hdv_watcher/features/item/data/model/item_model.dart';
import 'package:hdv_watcher/features/item/domain/entitie/item.dart';
import 'package:http/http.dart' as http;

abstract class ItemRemoteDateSource {
  Future<List<Item>> fetchItems();
}

class ItemRemoteDateSourceImpl implements ItemRemoteDateSource {
  final DatesUtilsImpl dateUtils = DatesUtilsImpl();
  final ArrayUtilsImpl arrayUtils = ArrayUtilsImpl();

  @override
  Future<List<Item>> fetchItems() async {
    // faire la requête au serveur
    final Uri url = Uri.parse("url");
    final http.Response response = await http.get(url);
    // gérer en cas de bonne réponse
    if (response.statusCode == 200) {
      final List jsonData = json.decode(response.body);
      return jsonData
          .map<Item>(
            (json) => ItemModel.fromJson(
                json: json, datesUtils: dateUtils, arrayUtils: arrayUtils),
          )
          .toList();
    }
    throw ServerException(
        errorMessage:
            "Mauvaise requête serveur, veuillez ré-essayer plus tard");
  }
}
