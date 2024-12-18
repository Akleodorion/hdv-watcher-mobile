import 'package:dartz/dartz.dart';
import 'package:hdv_watcher/core/enums/price_type.dart';
import 'package:hdv_watcher/core/errors/failures.dart';
import 'package:hdv_watcher/features/item/domain/entitie/item.dart';

abstract class ItemRepository {
  Future<Either<Failure, Item>> fetchItem({required Item item});
  Future<Either<Failure, Map<String, dynamic>>> fetchPaginatedItems({
    required int pageIndex,
    required PriceType priceType,
    required int batchSize,
  });
}
