import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
// import 'package:uuid/uuid.dart';

import 'flow_out_model.dart';
import 'flow_out_service.dart';

part 'flow_out_event.dart';
part 'flow_out_state.dart';

class FlowOutBloc extends Bloc<FlowOutEvent, FlowOutState> {
  final FlowOutService flowOutService;
  List<FlowOutModel> flowOuts = [
    // FlowOutModel(flowOutUID: const Uuid().v4(), flowOutQuantity: 10, totalQuantity: 30, flowOutDate: DateTime.now(), flowOutStatus: FlowOutStatus.done),
    // FlowOutModel(flowOutUID: const Uuid().v4(), flowOutQuantity: 10, totalQuantity: 30, flowOutDate: DateTime.now(), flowOutStatus: FlowOutStatus.waiting),
    // FlowOutModel(flowOutUID: const Uuid().v4(), flowOutQuantity: 10, totalQuantity: 30, flowOutDate: DateTime.now(), flowOutStatus: FlowOutStatus.ongoing),
    // FlowOutModel(flowOutUID: const Uuid().v4(), flowOutQuantity: 10, totalQuantity: 30, flowOutDate: DateTime.now(), flowOutStatus: FlowOutStatus.done),
  ];

  FlowOutBloc({required this.flowOutService}) : super(FlowOutInitial()) {

    // ===== Template ======
    on<FlowOutEvent>((event, emit) {
    });

    // ===== Get =====
    on<FlowOutLoadingEvent>((event, emit) async {
      emit(FlowOutLoading());
      try {
        final flowOutList = await flowOutService.getAllFlowOut();
        emit(FlowOutLoaded(flowOuts: flowOutList));
      } catch (e) {
        emit(FlowOutError(e: 'Failed to load flow ins: $e'));
      }
      // emit(FlowOutLoaded(flowOuts: flowOuts));
    });

    // ===== Creation =====
    on<FlowOutCreationEvent>((event, emit) {
      emit(FlowOutLoading());
      List<FlowOutModel> updatedFlowOut = List.from(flowOuts);
      updatedFlowOut.add(event.newFlowOut);
      flowOuts = updatedFlowOut;
      emit(FlowOutLoaded(flowOuts: updatedFlowOut));
    });
  }
}