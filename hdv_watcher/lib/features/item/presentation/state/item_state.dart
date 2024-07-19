import 'package:equatable/equatable.dart';

import '../../domain/entitie/item.dart';

class ItemState extends Equatable {
  @override
  List<Object?> get props => [];
}

class Loaded extends ItemState {
  final List<Item> items;

  Loaded({required this.items});
}

class Loading extends ItemState {}

class Error extends ItemState {
  final String errorMessage;

  Error({required this.errorMessage});
}
