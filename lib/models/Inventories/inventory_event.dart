part of 'inventory_bloc.dart';

abstract class InventoryEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class InventoryLoadingEvent extends InventoryEvent {}

class InventoryCreationEvent extends InventoryEvent {
  final InventoryModel newItem;

  InventoryCreationEvent({required this.newItem});

  @override
  List<Object?> get props => [newItem];
}

class InventoryIncrementEvent extends InventoryEvent {
  final int index;
  final int count;

  InventoryIncrementEvent({required this.index, required this.count});

  @override
  List<Object?> get props => [index, count];
}

class InventoryDecrementEvent extends InventoryEvent {
  final int index;
  final int count;

  InventoryDecrementEvent({required this.index, required this.count});

  @override
  List<Object?> get props => [index, count];
}

class InventoryDeletionEvent extends InventoryEvent {
  final int index;

  InventoryDeletionEvent({required this.index});

  @override
  List<Object?> get props => [index];
}