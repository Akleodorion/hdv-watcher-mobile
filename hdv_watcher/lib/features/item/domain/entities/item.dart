import 'package:equatable/equatable.dart';

class Item extends Equatable {
  final int id;
  final String name;
  final String imgUrl;
  final List<DateTime> scrapDate;
  final List<int> unitPrice;
  final List<int> tenthPrice;
  final List<int> hundredPrice;
  final double fXp;
  final int xpQuantity;
  final String ressourceType;
  final bool mustBuy;

  const Item({
    required this.id,
    required this.name,
    required this.imgUrl,
    required this.scrapDate,
    required this.unitPrice,
    required this.tenthPrice,
    required this.hundredPrice,
    required this.fXp,
    required this.xpQuantity,
    required this.ressourceType,
    required this.mustBuy,
  });
  get betterPrice {
    final List<int> prices = [
      unitPrice.last,
      (tenthPrice.last / 10).round(),
      (hundredPrice.last / 100).round(),
    ];

    return prices.fold(unitPrice.last, (prev, value) {
      if (prev > value && value != 0) {
        return prev = value;
      }
      return prev;
    });
  }

  get quantityFor100Xp {
    final qtyPerUnitXp = xpQuantity * fXp;
    return 197000 / qtyPerUnitXp;
  }

  @override
  List<Object?> get props => [
        id,
        name,
        imgUrl,
        scrapDate,
        unitPrice,
        tenthPrice,
        hundredPrice,
        fXp,
        xpQuantity,
        ressourceType,
        mustBuy,
      ];
}
