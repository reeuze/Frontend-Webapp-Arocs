part of 'robot_bloc.dart';

abstract class RobotState extends Equatable{
  @override
  List<Object?> get props => [];
}

class RobotInitial extends RobotState {}

class RobotLoading extends RobotState {}

class RobotLoaded extends RobotState {
  final List<RobotModel> robots;

  RobotLoaded({required this.robots});

  @override
  List<Object?> get props => [robots];
}

class RobotError extends RobotState {
  final String e;

  RobotError({required this.e});

  @override
  List<Object?> get props => [e];
}