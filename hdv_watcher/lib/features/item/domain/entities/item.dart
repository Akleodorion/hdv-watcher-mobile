import 'package:equatable/equatable.dart';
import 'package:hdv_watcher/obects/classes/prices/super_prices.dart';
import '../../../../obects/classes/prices/price.dart';

class Item extends Equatable {
  final int id;
  final String name;
  final String imgUrl;
  final SuperPrices superPrices;
  final double fXp;
  final int qtyForUnitXp;
  final String ressourceType;
  final bool mustBuy;

  const Item({
    required this.id,
    required this.name,
    required this.imgUrl,
    required this.superPrices,
    required this.fXp,
    required this.qtyForUnitXp,
    required this.ressourceType,
    required this.mustBuy,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        imgUrl,
        superPrices,
        fXp,
        qtyForUnitXp,
        ressourceType,
        mustBuy,
      ];

  double calculateItemXp() {
    return (fXp / qtyForUnitXp);
  }

  double get itemXp {
    return calculateItemXp();
  }

  String get lowerPriceString {
    return superPrices.lowerPriceString;
  }

  int get kamasPerXp {
    final double itemXp = calculateItemXp();
    final Price lowerPrice = superPrices.lowerPrice;
    final int xpPerKamas = (lowerPrice.unitPrice / itemXp).round();
    return xpPerKamas;
  }

  int get qtyFor100Xp {
    final double itemXp = calculateItemXp();
    const petXpRequired = 197000;
    if (itemXp == 0) {
      return 0;
    }
    return (petXpRequired / itemXp).round();
  }

  String get qtyFor100XpString {
    final double itemXp = calculateItemXp();
    const petXpRequired = 197000;
    if (itemXp == 0) {
      return "Quantité requise: Nan";
    }
    final value = (petXpRequired / itemXp).round();
    return "Qte requise: $value";
  }

  int get totalCost {
    return qtyFor100Xp * superPrices.lowerPrice.unitPrice;
  }

  String get totalCostString {
    return "Total: $totalCost K";
  }
}
