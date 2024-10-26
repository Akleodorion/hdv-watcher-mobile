// Mocks generated by Mockito 5.4.4 from annotations
// in hdv_watcher/test/features/item/presentation/providers/items/notifiers/fetch_item_notifier_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;

import 'package:dartz/dartz.dart' as _i2;
import 'package:hdv_watcher/core/errors/failures.dart' as _i7;
import 'package:hdv_watcher/features/item/domain/entitie/item.dart' as _i8;
import 'package:hdv_watcher/features/item/domain/usecase/fetch_item_usecase.dart'
    as _i5;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i9;
import 'package:riverpod/src/internals.dart' as _i3;
import 'package:state_notifier/state_notifier.dart' as _i4;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeAlwaysAliveRefreshable_1<T1> extends _i1.SmartFake
    implements _i3.AlwaysAliveRefreshable<T1> {
  _FakeAlwaysAliveRefreshable_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeStateNotifierProviderElement_2<
        NotifierT1 extends _i4.StateNotifier<T1>, T1> extends _i1.SmartFake
    implements _i3.StateNotifierProviderElement<NotifierT1, T1> {
  _FakeStateNotifierProviderElement_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeOverride_3 extends _i1.SmartFake implements _i3.Override {
  _FakeOverride_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeProviderSubscription_4<State> extends _i1.SmartFake
    implements _i3.ProviderSubscription<State> {
  _FakeProviderSubscription_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeAlwaysAliveProviderListenable_5<State> extends _i1.SmartFake
    implements _i3.AlwaysAliveProviderListenable<State> {
  _FakeAlwaysAliveProviderListenable_5(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [FetchItemUsecase].
///
/// See the documentation for Mockito's code generation for more information.
class MockFetchItemUsecase extends _i1.Mock implements _i5.FetchItemUsecase {
  MockFetchItemUsecase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i2.Either<_i7.Failure, _i8.Item>> call(
          {required _i8.Item? item}) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [],
          {#item: item},
        ),
        returnValue: _i6.Future<_i2.Either<_i7.Failure, _i8.Item>>.value(
            _FakeEither_0<_i7.Failure, _i8.Item>(
          this,
          Invocation.method(
            #call,
            [],
            {#item: item},
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, _i8.Item>>);
}

/// A class which mocks [StateNotifierProvider].
///
/// See the documentation for Mockito's code generation for more information.
class MockStateNotifierProvider<NotifierT extends _i4.StateNotifier<T>, T>
    extends _i1.Mock implements _i3.StateNotifierProvider<NotifierT, T> {
  MockStateNotifierProvider() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.AlwaysAliveRefreshable<NotifierT> get notifier => (super.noSuchMethod(
        Invocation.getter(#notifier),
        returnValue: _FakeAlwaysAliveRefreshable_1<NotifierT>(
          this,
          Invocation.getter(#notifier),
        ),
      ) as _i3.AlwaysAliveRefreshable<NotifierT>);

  @override
  _i3.StateNotifierProviderElement<NotifierT, T> createElement() =>
      (super.noSuchMethod(
        Invocation.method(
          #createElement,
          [],
        ),
        returnValue: _FakeStateNotifierProviderElement_2<NotifierT, T>(
          this,
          Invocation.method(
            #createElement,
            [],
          ),
        ),
      ) as _i3.StateNotifierProviderElement<NotifierT, T>);

  @override
  _i3.Override overrideWith(
          _i3.Create<NotifierT, _i3.StateNotifierProviderRef<NotifierT, T>>?
              create) =>
      (super.noSuchMethod(
        Invocation.method(
          #overrideWith,
          [create],
        ),
        returnValue: _FakeOverride_3(
          this,
          Invocation.method(
            #overrideWith,
            [create],
          ),
        ),
      ) as _i3.Override);

  @override
  _i3.ProviderSubscription<T> addListener(
    _i3.Node? node,
    void Function(
      T?,
      T,
    )? listener, {
    required void Function(
      Object,
      StackTrace,
    )? onError,
    required void Function()? onDependencyMayHaveChanged,
    required bool? fireImmediately,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #addListener,
          [
            node,
            listener,
          ],
          {
            #onError: onError,
            #onDependencyMayHaveChanged: onDependencyMayHaveChanged,
            #fireImmediately: fireImmediately,
          },
        ),
        returnValue: _FakeProviderSubscription_4<T>(
          this,
          Invocation.method(
            #addListener,
            [
              node,
              listener,
            ],
            {
              #onError: onError,
              #onDependencyMayHaveChanged: onDependencyMayHaveChanged,
              #fireImmediately: fireImmediately,
            },
          ),
        ),
      ) as _i3.ProviderSubscription<T>);

  @override
  T read(_i3.Node? node) => (super.noSuchMethod(
        Invocation.method(
          #read,
          [node],
        ),
        returnValue: _i9.dummyValue<T>(
          this,
          Invocation.method(
            #read,
            [node],
          ),
        ),
      ) as T);

  @override
  _i3.AlwaysAliveProviderListenable<Selected> select<Selected>(
          Selected Function(T)? selector) =>
      (super.noSuchMethod(
        Invocation.method(
          #select,
          [selector],
        ),
        returnValue: _FakeAlwaysAliveProviderListenable_5<Selected>(
          this,
          Invocation.method(
            #select,
            [selector],
          ),
        ),
      ) as _i3.AlwaysAliveProviderListenable<Selected>);
}
