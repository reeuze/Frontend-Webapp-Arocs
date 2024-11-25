import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
// import 'package:uuid/uuid.dart';

// import 'dart:developer' as developer;
// import 'package:http/http.dart' as http;
// import 'dart:convert';

import 'flow_in_model.dart';
import 'flow_in_service.dart';

part 'flow_in_event.dart';
part 'flow_in_state.dart';

class FlowInBloc extends Bloc<FlowInEvent, FlowInState> {

  final FlowInService flowInService;
  List<FlowInModel> flowIns = [
    // FlowInModel(flowInUID: const Uuid().v4(), flowInQuantity: 20, totalQuantity: 30, flowInDate: DateTime.now(), flowInStatus: FlowInStatus.waiting),
    // FlowInModel(flowInUID: const Uuid().v4(), flowInQuantity: 20, totalQuantity: 30, flowInDate: DateTime.now(), flowInStatus: FlowInStatus.waiting),
    // FlowInModel(flowInUID: const Uuid().v4(), flowInQuantity: 20, totalQuantity: 30, flowInDate: DateTime.now(), flowInStatus: FlowInStatus.done),
    // FlowInModel(flowInUID: const Uuid().v4(), flowInQuantity: 20, totalQuantity: 30, flowInDate: DateTime.now(), flowInStatus: FlowInStatus.ongoing),
    // FlowInModel(flowInUID: const Uuid().v4(), flowInQuantity: 20, totalQuantity: 30, flowInDate: DateTime.now(), flowInStatus: FlowInStatus.ongoing),
  ];

  FlowInBloc({required this.flowInService}) : super(FlowInInitial()) {

    // ===== Template ======
    on<FlowInEvent>((event, emit) {
    });


    // ===== Get =====
    on<FlowInLoadingEvent>((event, emit) async {
      emit(FlowInLoading());
      try {
        final flowInList = await flowInService.getAllFlowIn();
        emit(FlowInLoaded(flowIns: flowInList));
      } catch (e) {
        emit(FlowInError(e: 'Failed to load flow ins: $e'));
      }
      // emit(FlowInLoaded(flowIns: flowIns));
    });

    // ===== Creation =====
    on<FlowInCreationEvent>((event, emit) {
      emit(FlowInLoading());
      List<FlowInModel> updatedFlowIn = List.from(flowIns);
      updatedFlowIn.add(event.newFlowIn);
      flowIns = updatedFlowIn;
      emit(FlowInLoaded(flowIns: updatedFlowIn));
    });
  }
}