part of 'robot_bloc.dart';

abstract class RobotEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class RobotLoadingEvent extends RobotEvent {}

class RobotConnectingEvent extends RobotEvent {}