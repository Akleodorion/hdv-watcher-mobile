import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/item.dart';

abstract class ItemRepository{
  Future<Either<Failure,Item>> usecase();
}

