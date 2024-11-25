import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'warehouse_model.dart';

part 'warehouse_event.dart';
part 'warehouse_state.dart';  

class WarehouseBloc extends Bloc<WarehouseEvent, WarehouseState> {
    WarehouseModel warehouse = WarehouseModel(
        maps: [[TileModel(arucoId: 0, isPath: 0)]], 
        columns: 1, 
        rows: 1
    );

    final TileModel templateTile = TileModel(arucoId: 0, isPath: 0);
    
    WarehouseBloc() : super(WarehouseInitial()) {

        // ===== Template =====
        on<WarehouseEvent>((event, emit) {
           
        });


        on<WarehouseLoadingEvent>((event, emit) {
           emit(WarehouseLoading());

           emit(WarehouseLoaded(model: warehouse));
        });

        on<WarehouseExpandXEvent>((event, emit) {
           emit(WarehouseLoading());

           List<List<TileModel>> updatedTile = List.from(warehouse.maps);
           
           for (var element in updatedTile) {
             element.add(templateTile);
           }

           WarehouseModel updatedWarehouse = warehouse.copyWith(updatedTile, warehouse.columns+1, warehouse.rows);
           warehouse = updatedWarehouse;

           emit(WarehouseLoaded(model: updatedWarehouse));
        }); 

        on<WarehouseExpandYEvent>((event, emit) {
           emit(WarehouseLoading());

           List<List<TileModel>> updatedTile = List.from(warehouse.maps);

            updatedTile.add(List.generate(warehouse.columns, (_) => templateTile));

           WarehouseModel updatedWarehouse = warehouse.copyWith(updatedTile, warehouse.columns, warehouse.rows+1);
           warehouse = updatedWarehouse;

           emit(WarehouseLoaded(model: updatedWarehouse));
        });

        on<WarehouseUpdateTileEvent>((event, emit) {
           emit(WarehouseLoading());

           List<List<TileModel>> updatedTile = List.from(warehouse.maps);

           updatedTile[event.rowIndex][event.columnIndex] = event.updatedTile;

           WarehouseModel updatedWarehouse = warehouse.copyWith(updatedTile, warehouse.columns, warehouse.rows);
           warehouse = updatedWarehouse;

           emit(WarehouseLoaded(model: updatedWarehouse));
        });
    }
}