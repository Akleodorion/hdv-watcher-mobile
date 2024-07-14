import 'package:equatable/equatable.dart';
import 'package:hdv_watcher/obects/classes/prices/super_prices.dart';

class Item extends Equatable {
  final int id;
  final String name;
  final String imgUrl;
  final List<DateTime> scrapDate;
  final SuperPrices superPrices;
  final double fXp;
  final int xpQuantity;
  final String ressourceType;
  final bool mustBuy;

  const Item({
    required this.id,
    required this.name,
    required this.imgUrl,
    required this.scrapDate,
    required this.superPrices,
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
        superPrices,
        fXp,
        xpQuantity,
        ressourceType,
        mustBuy,
      ];
}
