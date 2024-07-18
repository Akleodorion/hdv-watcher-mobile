import 'package:dartz/dartz.dart';
import 'package:hdv_watcher/core/errors/failures.dart';
import 'package:hdv_watcher/features/item/domain/entitie/item.dart';
import 'package:hdv_watcher/features/item/domain/repository/item_repository.dart';

class FetchItemsUsecase {
  final ItemRepository _repository;

  FetchItemsUsecase({required ItemRepository repository})
      : _repository = repository;

  Future<Either<Failure, List<Item>>> call() async {
    return await _repository.fetchItems();
  }
}
