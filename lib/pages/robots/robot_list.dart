import 'package:flutter/material.dart';

import 'package:arocs_controller/models/robots/robot_model.dart';

class RobotList extends StatelessWidget {
  const RobotList({super.key, required this.robot});
  final RobotModel robot;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: (robot.robotStatus == RobotStatus.ready) ? Colors.greenAccent :
                  (robot.robotStatus == RobotStatus.working) ? Colors.yellowAccent :
                  Colors.orangeAccent,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Icon(
                  (robot.robotStatus == RobotStatus.ready) ? Icons.leak_add :
                  (robot.robotStatus == RobotStatus.working) ? Icons.sensors :
                  Icons.leak_remove),
              ),
              Expanded(
                flex: 5,
                child: Center(
                  child: Text(
                    "...${robot.robotUid.split('-').last}"
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Center(
                  child: Text(
                    (robot.robotStatus == RobotStatus.working) ? 'On Mission A' : ' -- '
                  ),
                ) 
              ),
              Expanded(
                flex: 2,
                child: Center(
                  child: Text(
                    (robot.robotStatus == RobotStatus.ready) ? 'Available' :
                    (robot.robotStatus == RobotStatus.working) ? 'Working' :
                    'Unavailable',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}