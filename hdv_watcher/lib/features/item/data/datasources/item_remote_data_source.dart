import 'dart:convert';

import 'package:hdv_watcher/core/errors/exceptions.dart';
import 'package:hdv_watcher/features/item/data/model/item_model.dart';
import 'package:http/http.dart' as http;

abstract class ItemRemoteDataSource {
  // Fetch User Data
  Future<List<ItemModel>> fetchItem();
}

class ItemRemoteDataSourceImpl implements ItemRemoteDataSource {
  @override
  Future<List<ItemModel>> fetchItem() async {
    final url = Uri.parse("http://lcoalhost:3000/items");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List datas = json.decode(response.body);
      final List<ItemModel> items = datas.map((data) => ItemModel.fromJson(data)).toList();
      return items;
    } 

    throw ServerException(errorMessage: "Une erreur s'est produite");
  }
}
