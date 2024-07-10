import 'package:equatable/equatable.dart';

import '../../../../domain/entities/item.dart';

abstract class FetchItemState extends Equatable{
  @override
  List<Object?> get props => [];
}

class Loading extends FetchItemState {}

class Loaded extends FetchItemState {
  final List<Item> items;
  Loaded({required this.items});
}

class Error extends FetchItemState {
  final String message;

  Error({required this.message});
}