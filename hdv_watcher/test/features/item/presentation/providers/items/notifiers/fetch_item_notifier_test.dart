import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hdv_watcher/core/errors/failures.dart';
import 'package:hdv_watcher/features/item/domain/entitie/item.dart';
import 'package:hdv_watcher/features/item/domain/usecase/fetch_item_usecase.dart';
import 'package:hdv_watcher/features/item/presentation/providers/items/notifiers/fetch_item_notifier.dart';
import 'package:hdv_watcher/features/item/presentation/providers/items/state/fetch_item_state.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../../../test_data/items_test_data.dart';
import 'fetch_item_notifier_test.mocks.dart';

@GenerateMocks([FetchItemUsecase, StateNotifierProvider])
void main() {
  late MockFetchItemUsecase mockFetchItemUsecase;
  late MockStateNotifierProvider mockStateNotifierProvider;
  late FetchItemNotifier sut;

  setUp(() {
    mockFetchItemUsecase = MockFetchItemUsecase();
    mockStateNotifierProvider = MockStateNotifierProvider();
    sut = FetchItemNotifier(fetchItemsUsecase: mockFetchItemUsecase);
  });

  test("should return Loading", () {
    expect(sut.initialState, Unloaded());
  });
  group("fetch Item", () {
    final Item tItem = itemGenerator(name: "Test Item", priceQuantity: 10);
    // test('should emit [Loading, Loaded] when the call is a success', () async {
    //   //arrange
    //   when(mockFetchItemUsecase.call(item: anyNamed('item')))
    //       .thenAnswer((_) async => Right(tItem));
    //   //act
    //   final expectedState = [Loading(), Loaded(item: tItem)];
    //   expectLater(sut.stream, emitsInOrder(expectedState));
    //   //assert
    //   sut.fetchItem(
    //       item: tItem,
    //       provider: mockWidgetRef.read(unitItemsProvider.notifier));
    // });

    test('should emit [Loading,Error] when the call is a success', () async {
      //arrange
      when(mockFetchItemUsecase.call(item: anyNamed('item'))).thenAnswer(
          (_) async => const Left(ServerFailure(errorMessage: "oops")));
      //act
      final expectedState = [
        Loading(),
        Error(
          errorMessage: "oops",
          item: null,
        )
      ];
      expectLater(sut.stream, emitsInOrder(expectedState));
      //assert
      sut.fetchItem(item: tItem, provider: mockStateNotifierProvider);
    });
  });
}
