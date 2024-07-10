import 'package:equatable/equatable.dart';

class Item extends Equatable {
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
