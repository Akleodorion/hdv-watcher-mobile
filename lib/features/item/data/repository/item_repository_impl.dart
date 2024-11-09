import 'package:dartz/dartz.dart';
import 'package:hdv_watcher/core/enums/price_type.dart';
import 'package:hdv_watcher/core/errors/exceptions.dart';
import 'package:hdv_watcher/core/errors/failures.dart';
import 'package:hdv_watcher/features/item/data/datasources/item_remote_date_source.dart';
import 'package:hdv_watcher/features/item/domain/entitie/item.dart';
import 'package:hdv_watcher/features/item/domain/repository/item_repository.dart';

class ItemRepositoryImpl implements ItemRepository {
  final ItemRemoteDateSource dataSource;

  ItemRepositoryImpl({required this.dataSource});
  @override
  Future<Either<Failure, Item>> fetchItem({required Item item}) async {
    try {
      final Item newItem = await dataSource.fetchItem(item: item);
      return Right(newItem);
    } on ServerException catch (error) {
      return Left(ServerFailure(errorMessage: error.errorMessage));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> fetchPaginatedItems(
      {required int pageIndex,
      required PriceType priceType,
      required int batchSize}) async {
    try {
      final resultMap = await dataSource.fetchPaginatedItems(
          pageIndex: pageIndex, priceType: priceType, batchSize: batchSize);
      return Right(resultMap);
    } on ServerException catch (e) {
      return Left(ServerFailure(errorMessage: e.errorMessage));
    }
  }
}
