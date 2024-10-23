import 'package:equatable/equatable.dart';
import 'package:hdv_watcher/core/classes/prices/price.dart';
import 'package:hdv_watcher/core/classes/prices/super_price.dart';
import 'package:hdv_watcher/core/enums/price_type.dart';
import 'package:hdv_watcher/core/enums/ressource_type.dart';

class Item extends Equatable {
  final int id;
  final String name;
  final String imgUrl;
  final RessourceType ressourceType;
  final SuperPrice superPrice;
  final bool isLoaded;

  const Item(
      {required this.id,
      required this.name,
      required this.imgUrl,
      required this.ressourceType,
      required this.superPrice,
      required this.isLoaded});

  Item copyWith() {
    return Item(
      id: id,
      name: name,
      imgUrl: imgUrl,
      ressourceType: ressourceType,
      superPrice: superPrice,
      isLoaded: isLoaded,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        imgUrl,
        ressourceType,
        superPrice,
        isLoaded,
      ];

  Map<PriceType, List<Price>> get priceList {
    return superPrice.priceList;
  }
}
