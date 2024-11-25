part of 'flow_out_bloc.dart';

abstract class FlowOutEvent extends Equatable {
  const FlowOutEvent();

  @override
  List<Object> get props => [];
}

class FlowOutLoadingEvent extends FlowOutEvent {}

class FlowOutCreationEvent extends FlowOutEvent {
  final FlowOutModel newFlowOut;

  const FlowOutCreationEvent({required this.newFlowOut});

  @override
  List<Object> get props => [newFlowOut];
}
