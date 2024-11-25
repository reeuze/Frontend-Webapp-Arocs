import 'package:arocs_controller/models/flowin/flow_in_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:arocs_controller/models/flowin/flow_in.dart';
import 'flowin_creation.dart';
import 'flowin_list.dart';

class FlowinPage extends StatelessWidget {
  const FlowinPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 240, 240, 240),
      child: BlocBuilder<FlowInBloc, FlowInState>(
        builder: (context, state) {
          if (state is FlowInLoaded){
            return Column(
              children: [
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                      child: ElevatedButton(
                        onPressed: () {
                          showDialog(
                            context: context, 
                            builder: (context) {
                              return const FlowinCreation();
                            } 
                          );
                        }, 
                        child: const Text(
                          'New Item'
                        ) 
                      ),
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 112, 93),
                    borderRadius: BorderRadius.circular(9)
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 2),
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Center(
                            child: Text(
                              'Date'
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Center(
                            child: Text(
                              'Flow In Id'
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Center(
                            child: Text(
                              'Flow In Quantity'
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Center(
                            child: Text(
                              'Total Quantity'
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Center(
                            child: Text(
                              'Flow In Status'
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: state.flowIns.length,
                    itemBuilder: (BuildContext contex, index) {
                      return FlowinList(flowIn: state.flowIns[index]);
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