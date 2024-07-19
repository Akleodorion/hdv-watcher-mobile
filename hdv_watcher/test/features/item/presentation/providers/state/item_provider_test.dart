import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hdv_watcher/core/errors/failures.dart';
import 'package:hdv_watcher/features/item/domain/usecase/fetch_items_usecase.dart';
import 'package:hdv_watcher/features/item/presentation/providers/state/item_notifier.dart';
import 'package:hdv_watcher/features/item/presentation/providers/state/item_state.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../../test_data/items.dart';
import 'item_provider_test.mocks.dart';

@GenerateMocks([FetchItemsUsecase])
void main() {
  late MockFetchItemsUsecase mockFetchItemsUsecase;
  late ItemNotifier sut;

  setUp(() {
    mockFetchItemsUsecase = MockFetchItemsUsecase();
    sut = ItemNotifier(fetchItemsUsecase: mockFetchItemsUsecase);
  });

  test("should return Loading", () {
    expect(sut.initialState, Loading());
  });
  group("fetchItems", () {
    test('should emit [Loaded] when the call is a success', () async {
      //arrange
      when(mockFetchItemsUsecase.call())
          .thenAnswer((_) async => Right([tItem]));
      //act
      final expectedState = [
        Loaded(items: [tItem])
      ];
      expectLater(sut.stream, emitsInOrder(expectedState));
      //assert
      sut.fetchItem();
    });

    test('should emit [Error] when the call is a success', () async {
      //arrange
      when(mockFetchItemsUsecase.call()).thenAnswer(
          (_) async => const Left(ServerFailure(errorMessage: "oops")));
      //act
      final expectedState = [Error(errorMessage: "oops")];
      expectLater(sut.stream, emitsInOrder(expectedState));
      //assert
      sut.fetchItem();
    });
  });
}
