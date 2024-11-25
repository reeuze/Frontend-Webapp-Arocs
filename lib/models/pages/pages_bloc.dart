import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';

import 'package:arocs_controller/pages/inventories/inventory_page.dart';
import 'package:arocs_controller/pages/robots/robot_page.dart';
import 'package:arocs_controller/pages/flowin/flowin_page.dart';
import 'package:arocs_controller/pages/flowout/flowout_page.dart';
import 'package:arocs_controller/pages/warehouse/warehouse.dart';

import 'pages_model.dart';

part 'pages_state.dart';
part 'pages_event.dart';

class PagesBloc extends Bloc<PagesEvent, PagesState> {
  List<PagesModel> pages = [];

  List<List<PagesModel>> allPages = [];

  void initializeAllPages() {
    allPages = [
      [
        PagesModel(body: const Text('Dashboard'), title: 'Dashboard')
      ],
      [
        PagesModel(body: const WarehousePage(), title: 'Warehouse Maps')
      ],
      [
        PagesModel(body: const InventoryPage(), title: 'Inventory Page'),
      ],
      [
        PagesModel(body: const FlowinPage(), title: 'Flow In')
      ],
      [
        PagesModel(body: const FlowoutPage(), title: 'Flow Out')
      ],
      [
        PagesModel(body: const RobotPage(), title: 'Robot Page')
      ],
      [
        PagesModel(body: const Text('Robot Manual'), title: 'Robot Manual')
      ],
      [
        PagesModel(body: const Text('Setting'), title: 'Setting')
      ],
      [
        PagesModel(body: const Text('Info'), title: 'Info')
      ]
    ];
  }


  PagesBloc() : super(PagesInitial()) {
    on<PagesLoadingEvent>((event, emit) {
      emit(PagesLoading());
      initializeAllPages();
      pages = allPages[0];
      emit(PagesLoaded(pages: pages, loaded: 0));
    });

    on<PagesDeletedEvent>((event, emit) {
      final updatedPages = List<PagesModel>.from(pages);
      updatedPages.removeAt(event.index);
      allPages[(state as PagesLoaded).loaded] = updatedPages;
      pages = updatedPages;
      emit(PagesLoaded(pages: updatedPages, loaded: (state as PagesLoaded).loaded));
    });

    on<PagesCreatedEvent>((event, emit) {
      final updatedPages = List<PagesModel>.from(pages);
      updatedPages.add(event.page);
      allPages[(state as PagesLoaded).loaded] = updatedPages;
      pages = updatedPages;
      emit(PagesLoaded(pages: updatedPages, loaded: (state as PagesLoaded).loaded));
    });

    // Drawer Change using this Event
    on<ChangedDashboardEvent>((event, emit) {
      allPages[(state as PagesLoaded).loaded] = pages;
      final updatedPages = List<PagesModel>.from(allPages[0]);
      pages = updatedPages;
      emit(PagesLoaded(pages: updatedPages, loaded: 0));
    });

    on<ChangedMapEvent>((event, emit) {
      allPages[(state as PagesLoaded).loaded] = pages;
      final updatedPages = List<PagesModel>.from(allPages[1]);
      pages = updatedPages;
      emit(PagesLoaded(pages: updatedPages, loaded: 1));
    });

    on<ChangedInventoryEvent>((event, emit) {
      allPages[(state as PagesLoaded).loaded] = pages;
      final updatedPages = List<PagesModel>.from(allPages[2]);
      pages = updatedPages;
      emit(PagesLoaded(pages: updatedPages, loaded: 2));
    });

    on<ChangedFlowInEvent>((event, emit) {
      allPages[(state as PagesLoaded).loaded] = pages;
      final updatedPages = List<PagesModel>.from(allPages[3]);
      pages = updatedPages;
      emit(PagesLoaded(pages: updatedPages, loaded: 3));
    });

    on<ChangedFlowOutEvent>((event, emit) {
      allPages[(state as PagesLoaded).loaded] = pages;
      final updatedPages = List<PagesModel>.from(allPages[4]);
      pages = updatedPages;
      emit(PagesLoaded(pages: updatedPages, loaded: 4));
    });

    on<ChangedRobotEvent>((event, emit) {
      allPages[(state as PagesLoaded).loaded] = pages;
      final updatedPages = List<PagesModel>.from(allPages[5]);
      pages = updatedPages;
      emit(PagesLoaded(pages: updatedPages, loaded: 5));
    });

    on<ChangedRobotManualEvent>((event, emit) {
      allPages[(state as PagesLoaded).loaded] = pages;
      final updatedPages = List<PagesModel>.from(allPages[6]);
      pages = updatedPages;
      emit(PagesLoaded(pages: updatedPages, loaded: 6));
    });

    on<ChangedSettingEvent>((event, emit) {
      allPages[(state as PagesLoaded).loaded] = pages;
      final updatedPages = List<PagesModel>.from(allPages[7]);
      pages = updatedPages;
      emit(PagesLoaded(pages: updatedPages, loaded: 7));
    });

    on<ChangedInfoEvent>((event, emit) {
      allPages[(state as PagesLoaded).loaded] = pages;
      final updatedPages = List<PagesModel>.from(allPages[8]);
      pages = updatedPages;
      emit(PagesLoaded(pages: updatedPages, loaded: 8));
    });
  }
}