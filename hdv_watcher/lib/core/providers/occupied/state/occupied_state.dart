import 'package:equatable/equatable.dart';

class OccupiedState extends Equatable {
  @override
  List<Object?> get props => [];
}

class Loading extends OccupiedState {}

class Loaded extends OccupiedState {}
