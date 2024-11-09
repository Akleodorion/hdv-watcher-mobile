import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hdv_watcher/core/enums/price_type.dart';
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
    Item tItem = itemGenerator(name: 'Test Item', priceQuantity: 10);

    group("when the call is unsuccessfull", () {
      test('should return Left ServerFailure when the call is unsuccesfull',
          () async {
        //arrange
        when(mockItemRemoteDataSource.fetchItem(item: anyNamed('item')))
            .thenThrow(ServerException(errorMessage: "oops"));
        //act
        final result = await sut.fetchItem(item: tItem);
        //assert
        expect(result, const Left(ServerFailure(errorMessage: "oops")));
      });
    });
    group("when the call is successfull", () {
      final Item tItem = itemGenerator(name: "Item1 Test", priceQuantity: 10);
      test('should return Right(Item) when the call is succesfull', () async {
        //arrange
        when(mockItemRemoteDataSource.fetchItem(item: anyNamed('item')))
            .thenAnswer((_) async => tItem);
        //act
        final result = await sut.fetchItem(item: tItem);
        //assert
        expect(result, Right(tItem));
      });
    });
  });

  group("FetchPaginatedItem", () {
    final Item tItem = itemGenerator(name: "test item", priceQuantity: 10);
    final List<Item> items = [tItem];

    test('should return Left ServerFailure when the call is unsuccessfull',
        () async {
      //arrange
      when(mockItemRemoteDataSource.fetchPaginatedItems(
              batchSize: anyNamed('batchSize'),
              pageIndex: anyNamed('pageIndex'),
              priceType: anyNamed('priceType')))
          .thenThrow(ServerException(errorMessage: "oops"));
      //act
      final result = await sut.fetchPaginatedItems(
          batchSize: 50, pageIndex: 0, priceType: PriceType.unit);
      //assert
      expect(result, const Left(ServerFailure(errorMessage: "oops")));
    });

    test('should return Right List of Item when the call is successfull',
        () async {
      final tResult = {"items": items, "batches": 5, "batch_index": 0};
      //arrange
      when(mockItemRemoteDataSource.fetchPaginatedItems(
              batchSize: anyNamed('batchSize'),
              pageIndex: anyNamed('pageIndex'),
              priceType: anyNamed('priceType')))
          .thenAnswer((_) async => tResult);
      //act
      final result = await sut.fetchPaginatedItems(
          batchSize: 50, pageIndex: 0, priceType: PriceType.unit);
      //assert
      expect(result, Right(tResult));
    });
  });
}
