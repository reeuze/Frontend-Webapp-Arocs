part of 'flow_in_bloc.dart';

abstract class FlowInState extends Equatable {
  @override
  List<Object?> get props => [];
}

class FlowInInitial extends FlowInState {}

class FlowInLoading extends FlowInState {}

class FlowInLoaded extends FlowInState {
  final List<FlowInModel> flowIns;

  FlowInLoaded({required this.flowIns});

  @override
  List<Object?> get props => [flowIns];
}

class FlowInError extends FlowInState {
  final String e;

  FlowInError({required this.e});

  @override
  List<Object?> get props => [e];
}