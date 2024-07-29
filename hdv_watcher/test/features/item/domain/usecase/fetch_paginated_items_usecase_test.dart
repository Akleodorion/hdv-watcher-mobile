import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hdv_watcher/core/enums/price_type.dart';
import 'package:hdv_watcher/core/errors/failures.dart';
import 'package:hdv_watcher/features/item/domain/entitie/item.dart';
import 'package:hdv_watcher/features/item/domain/repository/item_repository.dart';
import 'package:hdv_watcher/features/item/domain/usecase/fetch_paginated_items_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../test_data/items_test_data.dart';
import 'fetch_paginated_items_usecase_test.mocks.dart';

@GenerateMocks([ItemRepository])
void main() {
  late MockItemRepository mockItemRepository;
  late FetchPaginatedItemsUsecase sut;

  setUp(() {
    mockItemRepository = MockItemRepository();
    sut = FetchPaginatedItemsUsecase(repository: mockItemRepository);
  });

  group("call", () {
    final Item item1 = itemGenerator(name: "Braises de tombouctou");
    final Item item2 = itemGenerator(name: "Poils de smilomouth");
    final Item item3 = itemGenerator(name: "Os de chafer");
    final List<Item> items = [item1, item2, item3];
    test('should return Left Server failure, when the call is not successfull',
        () async {
      //arrange
      when(mockItemRepository.fetchPaginatedItems(
              pageIndex: anyNamed('pageIndex'),
              priceType: anyNamed('priceType')))
          .thenAnswer(
              (_) async => const Left(ServerFailure(errorMessage: "oops")));
      //act
      final result = await sut.call(pageIndex: 0, priceType: PriceType.unit);
      //assert
      expect(result, const Left(ServerFailure(errorMessage: "oops")));
    });

    test('should return Right List of Item, when the call is successfull',
        () async {
      //arrange
      when(mockItemRepository.fetchPaginatedItems(
              pageIndex: anyNamed('pageIndex'),
              priceType: anyNamed('priceType')))
          .thenAnswer((_) async => Right(items));
      //act
      final result = await sut.call(pageIndex: 0, priceType: PriceType.unit);
      //assert
      expect(result, Right(items));
    });
  });
}
