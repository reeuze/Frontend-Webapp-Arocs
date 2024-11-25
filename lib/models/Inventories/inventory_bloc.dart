import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
// import 'dart:developer' as developer;

import 'inventory_model.dart';
import 'inventory_service.dart';

part 'inventory_state.dart';
part 'inventory_event.dart';

class InventoryBloc extends Bloc<InventoryEvent, InventoryState> {
  final InventoryService inventoryService;
  List<InventoryModel> items = [];

  InventoryBloc({required this.inventoryService}) : super(InventoryInitial()) {
    
    // ===== Template =====
    on<InventoryEvent>((event, emit) {
      
    });


    // ===== Get All =====
    on<InventoryLoadingEvent>((event, emit) async{
      emit(InventoryLoading());
      // developer.log('Loading Inventory');
      try {
        final inventoryList = await inventoryService.getAllProducts();
        emit(InventoryLoaded(items: inventoryList));
      } catch (e) {
        emit(InventoryError(e: 'Failed to load flow ins: $e'));
      }
      // emit(InventoryLoaded(items: items));
    });

    // ===== Creation =====
    on<InventoryCreationEvent>((event, emit) {
      emit(InventoryLoading());
      List<InventoryModel> updatedItems = List.from(items);
      updatedItems.add(event.newItem);
      items = updatedItems;
      emit(InventoryLoaded(items: updatedItems));
    });


    // ===== Update =====
    on<InventoryIncrementEvent>((event, emit) {
      emit(InventoryLoading());
      List<InventoryModel> updatedItems = List.from(items);
      updatedItems[event.index] = updatedItems[event.index].copyWith(itemInStock: updatedItems[event.index].itemInStock + event.count);
      items = updatedItems;
      emit(InventoryLoaded(items: updatedItems));
    });

    on<InventoryDecrementEvent>((event, emit) {
      emit(InventoryLoading());
      List<InventoryModel> updatedItems = List.from(items);
      updatedItems[event.index] = updatedItems[event.index].copyWith(itemInStock: updatedItems[event.index].itemInStock - event.count);
      items = updatedItems;
      emit(InventoryLoaded(items: updatedItems));
    });


    // ===== Deletion =====
    on<InventoryDeletionEvent>((event, emit) {
      emit(InventoryLoading());
      List<InventoryModel> updatedItems = List.from(items);
      updatedItems.removeAt(event.index);
      items = updatedItems;
      emit(InventoryLoaded(items: updatedItems));
    });

  }
}

