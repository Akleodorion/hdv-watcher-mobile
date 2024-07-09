import 'package:dartz/dartz.dart';
import 'package:hdv_watcher/core/errors/failures.dart';
import 'package:hdv_watcher/features/item/domain/entities/item.dart';
import 'package:hdv_watcher/features/item/domain/repositories/item_repository.dart';

class FetchAllItems{
  final ItemRepository repository;

  FetchAllItems({required this.repository});

  Future<Either<Failure,List<Item>>> call() async {
    return await repository.fetchAllItems();
  }
}