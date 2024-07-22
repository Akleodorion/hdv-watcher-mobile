import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hdv_watcher/core/errors/exceptions.dart';
import 'package:hdv_watcher/core/errors/failures.dart';
import 'package:hdv_watcher/features/item/data/datasources/item_remote_date_source.dart';
import 'package:hdv_watcher/features/item/data/repository/item_repository_impl.dart';
import 'package:hdv_watcher/features/item/domain/entitie/item.dart';

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../test_data/items_test_data.dart';
import 'item_repository_impl_test.mocks.dart';

@GenerateMocks([ItemRemoteDateSource])
void main() {
  late MockItemRemoteDateSource mockItemRemoteDataSource;
  late ItemRepositoryImpl sut;

  setUp(() {
    mockItemRemoteDataSource = MockItemRemoteDateSource();
    sut = ItemRepositoryImpl(dataSource: mockItemRemoteDataSource);
  });

  group("fetchItems", () {
    group("when the call is unsuccessfull", () {
      test('should return Left ServerFailure when the call is unsuccesfull',
          () async {
        //arrange
        when(mockItemRemoteDataSource.fetchItems())
            .thenThrow(ServerException(errorMessage: "oops"));
        //act
        final result = await sut.fetchItems();
        //assert
        expect(result, const Left(ServerFailure(errorMessage: "oops")));
      });
    });
    group("when the call is successfull", () {
      final List<Item> items = [tItem];
      test('should return Right(Item) when the call is succesfull', () async {
        //arrange
        when(mockItemRemoteDataSource.fetchItems())
            .thenAnswer((_) async => items);
        //act
        final result = await sut.fetchItems();
        //assert
        expect(result, Right(items));
      });
    });
  });
}
