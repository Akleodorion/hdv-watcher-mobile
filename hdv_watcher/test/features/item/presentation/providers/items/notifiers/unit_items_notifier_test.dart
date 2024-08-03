import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hdv_watcher/core/enums/price_type.dart';
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
    sut = UnitItemsNotifier(
        usecase: mockFetchPaginatedItemsUsecase, priceType: PriceType.unit);
  });

  group("initialState", () {
    test('should return Loading()', () async {
      //assert
      expect(sut.initialState, Loading());
    });
  });

  group("fetchInitialPaginatedItems", () {
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
      await sut.fetchInitialPaginatedItems();
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
      await sut.fetchInitialPaginatedItems();
    });
  });

  group("fetchPaginatedItems", () {
    group("When the call is unsuccessful", () {
      final tItems = [tItem];
      const tNumberOfBatches = 5;
      const tBachesCounter = 1;
      test('should emit Error', () async {
        //arrange
        when(mockFetchPaginatedItemsUsecase.call(
                pageIndex: anyNamed('pageIndex'),
                priceType: anyNamed('priceType')))
            .thenAnswer(
                (_) async => const Left(ServerFailure(errorMessage: "oops")));
        //assert Later
        final expected = [
          Error(
              errorMessage: "oops",
              items: tItems,
              numberOfBatches: tNumberOfBatches,
              bachesCounter: tBachesCounter)
        ];
        expectLater(sut.stream, emitsInOrder(expected));
        //act
        await sut.fetchPaginatedItems(
            pageIndex: 1,
            itemState:
                Loaded(items: tItems, numberOfBatches: 5, bachesCounter: 1));
      });
    });
    group("When the call is successful", () {
      final Map<String, dynamic> tResponseMap = {
        "items": [tItem],
        "batches": "5",
        "batch_index": 1,
      };
      test('should add items to the list ', () async {
        //arrange
        when(mockFetchPaginatedItemsUsecase.call(
                pageIndex: anyNamed('pageIndex'),
                priceType: anyNamed('priceType')))
            .thenAnswer((_) async => Right(tResponseMap));
        //act
        final result = await sut.fetchPaginatedItems(
            pageIndex: 1,
            itemState:
                Loaded(items: [tItem], numberOfBatches: 5, bachesCounter: 0));
        //assert
        expect(
            result,
            Loaded(
                items: [tItem, tItem], numberOfBatches: 5, bachesCounter: 1));
      });
    });
  });
}
