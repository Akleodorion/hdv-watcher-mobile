import 'package:dartz/dartz.dart';
import 'package:hdv_watcher/core/errors/failures.dart';
import 'package:hdv_watcher/features/item/domain/entitie/item.dart';
import 'package:hdv_watcher/features/item/domain/repository/item_repository.dart';

class FetchItemUsecase {
  final ItemRepository _repository;

  FetchItemUsecase({required ItemRepository repository})
      : _repository = repository;

  Future<Either<Failure, Item>> call({required Item item}) async {
    return await _repository.fetchItem(item: item);
  }
}
