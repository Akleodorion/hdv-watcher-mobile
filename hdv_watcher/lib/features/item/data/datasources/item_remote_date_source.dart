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
  Future<Item> fetchItem({required int itemId});
  Future<Map<String, dynamic>> fetchPaginatedItems(
      {required int pageIndex,
      required PriceType priceType,
      required int batchSize});
}

class ItemRemoteDateSourceImpl implements ItemRemoteDateSource {
  final DatesUtilsImpl dateUtils = DatesUtilsImpl();
  final ArrayUtilsImpl arrayUtils = ArrayUtilsImpl();

  @override
  Future<Item> fetchItem({required int itemId}) async {
    final Map<String, dynamic> params = {
      "item_id": itemId.toString(),
    };
    // faire la requête au serveur
    final Uri url = Uri.parse("http://localhost:3000/items/worth").replace(
      queryParameters: params,
    );
    final http.Response response =
        await http.get(url, headers: {'Accept': 'application/json'});

    // gérer en cas de bonne réponse
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      return ItemModel.fromJson(json: jsonData);
    }
    throw ServerException(
        errorMessage:
            "Mauvaise requête serveur, veuillez ré-essayer plus tard");
  }

  @override
  Future<Map<String, dynamic>> fetchPaginatedItems(
      {required int pageIndex,
      required PriceType priceType,
      required int batchSize}) async {
    final Map<String, dynamic> params = {
      "price_type": priceType.headerName,
      "batch_index": pageIndex.toString(),
      "batch_size": batchSize.toString(),
    };
    final Uri url = Uri.parse("http://localhost:3000/api/v1/items")
        .replace(queryParameters: params);

    final response =
        await http.get(url, headers: {'Accept': 'application/json'});

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      final List<Item> itemData = jsonData["items"]
          .map<Item>((json) => ItemModel.fromJson(json: json))
          .toList();

      final items = itemData
          .where((item) => item.ressourceType != RessourceType.unknown)
          .toList();

      return {
        'items': items,
        "batches": jsonData["number_of_batches"],
      };
    }
    throw ServerException(
        errorMessage:
            "Mauvaise requête serveur, veuillez ré-essayer plus tard");
  }
}
