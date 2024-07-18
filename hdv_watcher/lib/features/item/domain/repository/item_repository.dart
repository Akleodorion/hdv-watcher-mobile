import 'package:dartz/dartz.dart';
import 'package:hdv_watcher/core/errors/failures.dart';
import 'package:hdv_watcher/features/item/domain/entitie/item.dart';

abstract class ItemRepository {
  Future<Either<Failure, List<Item>>> fetchItems();
}
