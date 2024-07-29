import 'dart:convert';
import 'package:hdv_watcher/core/enums/price_type.dart';
import 'package:hdv_watcher/core/enums/ressource_type.dart';
import 'package:hdv_watcher/core/errors/exceptions.dart';
import 'package:hdv_watcher/core/utils/array_utils.dart';
import 'package:hdv_watcher/core/utils/dates_utils.dart';
import 'package:hdv_watcher/features/item/data/model/item_model.dart';
import 'package:hdv_watcher/features/item/domain/entitie/item.dart';
import 'package:http/http.dart' as http;

abstract class ItemRemoteDateSource {
  Future<List<Item>> fetchItems();
  Future<List<Item>> fetchPaginatedItems(
      {required int pageIndex, required PriceType priceType});
}

class ItemRemoteDateSourceImpl implements ItemRemoteDateSource {
  final DatesUtilsImpl dateUtils = DatesUtilsImpl();
  final ArrayUtilsImpl arrayUtils = ArrayUtilsImpl();

  @override
  Future<List<Item>> fetchItems() async {
    // faire la requête au serveur
    final Uri url = Uri.parse("http://localhost:3000/items/worth");
    final http.Response response = await http.get(url);
    // gérer en cas de bonne réponse
    if (response.statusCode == 200) {
      final List jsonData = json.decode(response.body);
      final List<Item> items = jsonData
          .map<Item>(
            (json) => ItemModel.fromJson(
                json: json, datesUtils: dateUtils, arrayUtils: arrayUtils),
          )
          .toList();
      return items
          .where((item) => item.ressourceType != RessourceType.unknown)
          .toList();
    }
    throw ServerException(
        errorMessage:
            "Mauvaise requête serveur, veuillez ré-essayer plus tard");
  }

  @override
  Future<List<Item>> fetchPaginatedItems(
      {required int pageIndex, required PriceType priceType}) async {
    // Etablir l'uri
    final Uri url = Uri.parse("http://localhost:3000/items/worth");
    // faire la requête et ajouter les headers.
    final response = await http.get(url, headers: {
      "price_type": priceType.name,
      "page_index": pageIndex.toString(),
    });

    if (response.statusCode == 200) {
      final List jsonData = json.decode(response.body);
      final List<Item> items = jsonData
          .map<Item>((json) => ItemModel.fromJson(
              json: json, datesUtils: dateUtils, arrayUtils: arrayUtils))
          .toList();
      return items
          .where((item) => item.ressourceType != RessourceType.unknown)
          .toList();
    }
    throw ServerException(
        errorMessage:
            "Mauvaise requête serveur, veuillez ré-essayer plus tard");
  }
}
