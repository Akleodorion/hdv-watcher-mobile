import 'package:dartz/dartz.dart';
import 'package:hdv_watcher/core/enums/price_type.dart';
import 'package:hdv_watcher/core/errors/failures.dart';
import 'package:hdv_watcher/features/item/domain/entitie/item.dart';
import 'package:hdv_watcher/features/item/domain/repository/item_repository.dart';

class FetchPaginatedItemsUsecase {
  final ItemRepository repository;

  FetchPaginatedItemsUsecase({required this.repository});

  Future<Either<Failure, List<Item>>?> call(
      {required int pageIndex, required PriceType priceType}) async {
    return await repository.fetchPaginatedItems(
      pageIndex: pageIndex,
      priceType: priceType,
    );
  }
}
