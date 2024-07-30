import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hdv_watcher/core/errors/failures.dart';
import 'package:hdv_watcher/features/item/domain/entitie/item.dart';
import 'package:hdv_watcher/features/item/domain/usecase/fetch_paginated_items_usecase.dart';
import 'package:hdv_watcher/features/item/presentation/providers/items/notifiers/unit_items_notifier.dart';
import 'package:hdv_watcher/features/item/presentation/providers/items/state/item_state.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../../../test_data/items_test_data.dart';
import 'unit_items_notifier_test.mocks.dart';

@GenerateMocks([FetchPaginatedItemsUsecase])
void main() {
  late MockFetchPaginatedItemsUsecase mockFetchPaginatedItemsUsecase;
  late UnitItemsNotifier sut;

  setUp(() {
    mockFetchPaginatedItemsUsecase = MockFetchPaginatedItemsUsecase();
    sut = UnitItemsNotifier(usecase: mockFetchPaginatedItemsUsecase);
  });

  group("initialState", () {
    test('should return Loading()', () async {
      //assert
      expect(sut.initialState, Loading());
    });
  });

  group("fetchPaginatedItems", () {
    final tResult = {
      "items": [tItem],
      "batches": 5,
      "batch_index": 0
    };
    test('should emit Loaded when the call is successfull', () async {
      //arrange
      when(mockFetchPaginatedItemsUsecase.call(
              pageIndex: anyNamed('pageIndex'),
              priceType: anyNamed('priceType')))
          .thenAnswer((_) async => Right(tResult));

      //assertLater
      final expected = [
        Loaded(
            items: tResult["items"] as List<Item>,
            numberOfBatches: tResult["batches"] as int,
            bachesCounter: tResult["batch_index"] as int)
      ];
      expectLater(sut.stream, emitsInOrder(expected));

      //act
      await sut.fetchInitialPaginatedItems(pageIndex: 0);
    });

    test('should emit Error when the call is successfull', () async {
      //arrange
      when(mockFetchPaginatedItemsUsecase.call(
              pageIndex: anyNamed('pageIndex'),
              priceType: anyNamed('priceType')))
          .thenAnswer(
              (_) async => const Left(ServerFailure(errorMessage: "oops")));

      //assertLater
      final expected = [
        Error(
            errorMessage: "oops",
            items: const [],
            numberOfBatches: 0,
            bachesCounter: 0)
      ];
      expectLater(sut.stream, emitsInOrder(expected));

      //act
      await sut.fetchInitialPaginatedItems(pageIndex: 0);
    });
  });
}
