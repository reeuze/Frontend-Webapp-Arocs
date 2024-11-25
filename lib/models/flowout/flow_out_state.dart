part of 'flow_out_bloc.dart';

abstract class FlowOutState extends Equatable {
  const FlowOutState();

  @override
  List<Object?> get props => [];
}

class FlowOutInitial extends FlowOutState {}

class FlowOutLoading extends FlowOutState {}

class FlowOutLoaded extends FlowOutState {
  final List<FlowOutModel> flowOuts;

  const FlowOutLoaded({required this.flowOuts});

  @override
  List<Object> get props => [flowOuts];
}

class FlowOutError extends FlowOutState {
  final String e;

  const FlowOutError({required this.e});

  @override
  List<Object?> get props => [e];
}