import 'package:equatable/equatable.dart';
import 'package:hdv_watcher/classes/price_class/super_price.dart';
import 'package:hdv_watcher/enums/ressource_type.dart';

class Item extends Equatable {
  final int id;
  final String name;
  final String imgUrl;
  final RessourceType ressourceType;
  final int petXp;
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
}
