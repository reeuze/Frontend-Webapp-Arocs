
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:arocs_controller/models/robots/robot.dart';
import 'robot_list.dart';

class RobotPage extends StatelessWidget {
  const RobotPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      color: const Color.fromARGB(255, 240, 240, 240),
      child: BlocBuilder<RobotBloc, RobotState>(
        builder: (context, state) {
          if (state is RobotLoaded){
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Card(
                    color: const Color.fromARGB(255, 255, 112, 93),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(),
                          ),
                          const Expanded(
                            flex: 5,
                            child: Center(
                              child: Text(
                                'Robot Id'
                              ),
                            ),
                          ),
                          const Expanded(
                            flex: 4,
                            child: Center(
                              child: Text(
                                'Robot Mission'
                              ),
                            )
                          ),
                          const Expanded(
                            flex: 2,
                            child: Center(
                              child: Text(
                                'Robot Status'
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: state.robots.length,
                    itemBuilder: (BuildContext contex, index) {
                      return RobotList(robot: state.robots[index]);
                    }, 
                  )
                )
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}