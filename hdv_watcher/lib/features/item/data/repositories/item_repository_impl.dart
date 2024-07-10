import 'package:dartz/dartz.dart';
import 'package:hdv_watcher/core/errors/exceptions.dart';
import 'package:hdv_watcher/core/errors/failures.dart';
import 'package:hdv_watcher/features/item/data/datasources/item_remote_data_source.dart';
import 'package:hdv_watcher/features/item/domain/entities/item.dart';
import '../../domain/repositories/item_repository.dart';

class ItemRepositoryImpl implements ItemRepository {
  final ItemRemoteDataSource dataSource;
  ItemRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, List<Item>>> fetchAllItems() async {
    
    try {
     final items = await dataSource.fetchItem();
     return Right(items);
    } on ServerException catch (error) {
      return Left(ServerFailure(errorMessage: error.errorMessage));
    }
  }
}