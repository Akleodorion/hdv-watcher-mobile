import 'package:equatable/equatable.dart';

import '../../../../domain/entitie/item.dart';

class ItemState extends Equatable {
  @override
  List<Object?> get props => [];
}

class Unloaded extends ItemState {}

class Loaded extends ItemState {
  final List<Item> items;
  final int numberOfBatches;
  final int bachesCounter;

  Loaded({
    required this.items,
    required this.numberOfBatches,
    required this.bachesCounter,
  });

  Loaded copyWith({required List<Item>? items}) {
    return Loaded(
      items: items ?? this.items,
      numberOfBatches: numberOfBatches,
      bachesCounter: bachesCounter + 1,
    );
  }

  @override
  List<Object?> get props => [
        items,
        numberOfBatches,
        bachesCounter,
      ];
}

class Loading extends ItemState {}

class Error extends ItemState {
  final String errorMessage;
  final List<Item> items;
  final int numberOfBatches;
  final int bachesCounter;

  Error({
    required this.errorMessage,
    required this.items,
    required this.numberOfBatches,
    required this.bachesCounter,
  });

  @override
  List<Object?> get props => [
        errorMessage,
        items,
        numberOfBatches,
        bachesCounter,
      ];
}
