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

  Map<String, dynamic> get betterPrice {
    final priceList = _retriveValideLastPrices(
      unitPrice,
      tenthPrice,
      hundredPrice,
    );

    return priceList.fold(priceList.first,
        (prev, next) => (prev["price"] < next["price"]) ? prev : next);
  }

  int get quantityFor100Xp {
    const maxPetXp = 197000;
    final qty = (maxPetXp / fXp) * xpQuantity;
    return qty.round();
  }

  get priceToFullXp {
    return (quantityFor100Xp * betterPrice["price"]);
  }

  List<Map<String, dynamic>> _retriveValideLastPrices(
      List<int> unitPrice, List<int> tenthPrice, List<int> hundredPrice) {
    final List<Map<String, dynamic>> list = [];
    list.add({
      "name": "unit_price",
      "price": unitPrice.last,
    });
    list.add({
      "name": "tenth_price",
      "price": (tenthPrice.last / 10).round(),
    });
    list.add({
      "name": "hundred_price",
      "price": (hundredPrice.last / 100).round(),
    });
    return list.where((item) => item["price"] > 0).toList();
  }
}
