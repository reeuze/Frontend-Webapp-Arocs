part of 'warehouse_bloc.dart';

abstract class WarehouseState extends Equatable {
  @override
  List<Object?> get props => [];
}

class WarehouseInitial extends WarehouseState {}

class WarehouseLoading extends WarehouseState {}

class WarehouseLoaded extends WarehouseState {
  final WarehouseModel model;

  WarehouseLoaded({required this.model});

  @override
  List<Object?> get props => [model];
}

class WarehouseError extends WarehouseState {
  final String e;

  WarehouseError({required this.e});

  @override
  List<Object?> get props => [e];
}

