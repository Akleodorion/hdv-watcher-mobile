import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hdv_watcher/core/enums/price_type.dart';
import 'package:hdv_watcher/core/errors/failures.dart';
import 'package:hdv_watcher/features/item/domain/usecase/fetch_paginated_items_usecase.dart';
import 'package:hdv_watcher/features/item/presentation/providers/items/notifiers/items_list_notifier.dart';
import 'package:hdv_watcher/features/item/presentation/providers/items/state/item_list_state.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../../../test_data/items_test_data.dart';
import 'items_notifier_test.mocks.dart';

@GenerateMocks([FetchPaginatedItemsUsecase])
void main() {
  late MockFetchPaginatedItemsUsecase mockFetchPaginatedItemsUsecase;
  late ItemsListNotifier sut;

  setUp(() {
    mockFetchPaginatedItemsUsecase = MockFetchPaginatedItemsUsecase();
    sut = ItemsListNotifier(
        usecase: mockFetchPaginatedItemsUsecase, priceType: PriceType.unit);
  });

  group("initialState", () {
    test('should return Unloaded', () async {
      //assert
      expect(sut.initialState, Unloaded());
    });
  });

  group("fetchInitialPaginatedItem", () {
    final Map<String, dynamic> tResultMap = {
      "items": [tItem],
      "batches": 5,
    };
    test('should emit [Loading,Loaded] when the call is a success', () async {
      //arrange
      when(mockFetchPaginatedItemsUsecase.call(
              batchSize: anyNamed('batchSize'),
              pageIndex: anyNamed('pageIndex'),
              priceType: anyNamed('priceType')))
          .thenAnswer((_) async => Right(tResultMap));
      //act
      final expected = [
        Loading(),
        Loaded(items: [tItem], numberOfBatches: 5, bachesCounter: 0)
      ];
      expectLater(sut.stream, emitsInOrder(expected));
      //assert
      sut.fetchInitialPaginatedItems();
    });
    test('should emit [Loading,Error] when the call is a success', () async {
      //arrange
      when(mockFetchPaginatedItemsUsecase.call(
              batchSize: anyNamed('batchSize'),
              pageIndex: anyNamed('pageIndex'),
              priceType: anyNamed('priceType')))
          .thenAnswer(
              (_) async => const Left(ServerFailure(errorMessage: "oops")));
      //act
      final expected = [
        Loading(),
        Error(
            errorMessage: "oops",
            items: const [],
            numberOfBatches: 0,
            bachesCounter: 0)
      ];
      expectLater(sut.stream, emitsInOrder(expected));
      //assert
      sut.fetchInitialPaginatedItems();
    });
  });

  group("fetchPaginatedItems", () {
    final Map<String, dynamic> tResultMap = {
      "items": [tItem],
      "batches": 5,
    };
    test('should emit [Loaded] when the call is a success', () async {
      //arrange
      when(mockFetchPaginatedItemsUsecase.call(
              batchSize: anyNamed('batchSize'),
              pageIndex: anyNamed('pageIndex'),
              priceType: anyNamed('priceType')))
          .thenAnswer((_) async => Right(tResultMap));
      //act
      final expectedState = [
        Loaded(items: [tItem, tItem], numberOfBatches: 5, bachesCounter: 1)
      ];
      expectLater(sut.stream, emitsInOrder(expectedState));
      //assert
      await sut.fetchPaginatedItems(
          batchSize: 50,
          pageIndex: 1,
          itemsListState:
              Loaded(items: [tItem], numberOfBatches: 5, bachesCounter: 0));
    });

    test('should emit [Error] when the call is not a success', () async {
      //arrange
      when(mockFetchPaginatedItemsUsecase.call(
              batchSize: anyNamed('batchSize'),
              pageIndex: anyNamed('pageIndex'),
              priceType: anyNamed('priceType')))
          .thenAnswer(
              (_) async => const Left(ServerFailure(errorMessage: "oops")));
      //act
      final expectedState = [
        Error(
            errorMessage: "oops",
            items: [tItem],
            numberOfBatches: 5,
            bachesCounter: 0)
      ];
      expectLater(sut.stream, emitsInOrder(expectedState));
      //assert
      await sut.fetchPaginatedItems(
          batchSize: 50,
          pageIndex: 1,
          itemsListState:
              Loaded(items: [tItem], numberOfBatches: 5, bachesCounter: 0));
    });
  });
}
