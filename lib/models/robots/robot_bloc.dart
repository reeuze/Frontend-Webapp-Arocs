import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:uuid/uuid.dart';

import 'robot_model.dart';
import 'robot_service.dart';

part 'robot_event.dart';
part 'robot_state.dart';

class RobotBloc extends Bloc<RobotEvent, RobotState> {
  final RobotService robotService;
  List<RobotModel> robots = [
    RobotModel(robotUid: const Uuid().v4(), robotStatus: RobotStatus.ready),
    RobotModel(robotUid: const Uuid().v4(), robotStatus: RobotStatus.unavailable),
    RobotModel(robotUid: const Uuid().v4(), robotStatus: RobotStatus.working)
  ];

  RobotBloc({required this.robotService}) : super(RobotInitial()) {
    
    // ===== Template =====
    on<RobotEvent>((event, emit) {

    });


    // ===== Get =====
    on<RobotLoadingEvent>((event, emit) async {
      emit(RobotLoading());
      try {
        final robotList = await robotService.getAllRobots();
        emit(RobotLoaded(robots: robotList));
      } catch (e) {
        emit(RobotError(e: 'Failed to load flow ins: $e'));
      }
      // emit(RobotLoaded(robots: robots));
    });

    
  }
}