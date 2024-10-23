import 'package:equatable/equatable.dart';

import '../../../../domain/entitie/item.dart';

class FetchItemState extends Equatable {
  @override
  List<Object?> get props => [];
}

class Unloaded extends FetchItemState {}

class Loaded extends FetchItemState {
  final Item item;

  Loaded({
    required this.item,
  });

  Loaded copyWith({required Item? item}) {
    return Loaded(
      item: item ?? this.item,
    );
  }

  @override
  List<Object?> get props => [item];
}

class Loading extends FetchItemState {}

class Error extends FetchItemState {
  final String errorMessage;
  final Item item;

  Error({
    required this.errorMessage,
    required this.item,
  });

  @override
  List<Object?> get props => [errorMessage, item];
}
