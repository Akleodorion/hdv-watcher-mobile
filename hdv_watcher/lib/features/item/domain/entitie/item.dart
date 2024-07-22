import 'package:equatable/equatable.dart';
import 'package:hdv_watcher/core/classes/prices/super_price.dart';
import 'package:hdv_watcher/core/enums/price_type.dart';
import 'package:hdv_watcher/core/enums/ressource_type.dart';

class Item extends Equatable {
  final int id;
  final String name;
  final String imgUrl;
  final RessourceType ressourceType;
  final double petXp;
  final int quantityForUnitXp;
  final SuperPrice superPrice;

  const Item({
    required this.id,
    required this.name,
    required this.imgUrl,
    required this.ressourceType,
    required this.petXp,
    required this.quantityForUnitXp,
    required this.superPrice,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        imgUrl,
        ressourceType,
        petXp,
        quantityForUnitXp,
        superPrice,
      ];

  Map<PriceType, int> get currentPriceMap {
    return superPrice.currentPrice;
  }

  Map<PriceType, int> get recommandedSellingPrice {
    return superPrice.recommandedSellingPrice;
  }
}
