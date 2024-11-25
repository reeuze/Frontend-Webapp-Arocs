part of 'inventory_bloc.dart';

abstract class InventoryState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InventoryInitial extends InventoryState {}

class InventoryLoading extends InventoryState {}

class InventoryLoaded extends InventoryState {
  final List<InventoryModel> items;

  InventoryLoaded({required this.items});

  @override
  List<Object?> get props => [items];
}

class InventoryError extends InventoryState {
  final String e;

  InventoryError({required this.e});

  @override
  List<Object?> get props => [e];
}