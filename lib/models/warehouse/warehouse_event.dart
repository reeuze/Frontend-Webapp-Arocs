part of 'warehouse_bloc.dart';

abstract class WarehouseEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class WarehouseLoadingEvent extends WarehouseEvent {}

class WarehouseExpandXEvent extends WarehouseEvent {}

class WarehouseExpandYEvent extends WarehouseEvent {}

class WarehouseUpdateTileEvent extends WarehouseEvent {
  final int columnIndex;
  final int rowIndex;
  final TileModel updatedTile;

  WarehouseUpdateTileEvent({required this.columnIndex, required this.rowIndex, required this.updatedTile});

  @override
  List<Object?> get props => [columnIndex, rowIndex, updatedTile];
}