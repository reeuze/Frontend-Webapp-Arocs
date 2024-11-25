part of 'flow_in_bloc.dart';

abstract class FlowInEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FlowInLoadingEvent extends FlowInEvent {
  FlowInLoadingEvent();
}

class FlowInCreationEvent extends FlowInEvent {
  final FlowInModel newFlowIn;

  FlowInCreationEvent({required this.newFlowIn});

  @override
  List<Object?> get props => [newFlowIn];
}