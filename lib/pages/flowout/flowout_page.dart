import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:arocs_controller/models/flowout/flow_out.dart';
import 'flowout_creation.dart';
import 'flowout_list.dart';

class FlowoutPage extends StatelessWidget {
  const FlowoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 240, 240, 240),
      child: BlocBuilder<FlowOutBloc, FlowOutState>(
        builder: (context, state) {
          if (state is FlowOutLoaded){
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
                              return const FlowoutCreation();
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
                  margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9),
                    color: const Color.fromARGB(255, 255, 112, 93),
                  ),
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
                    itemCount: state.flowOuts.length,
                    itemBuilder: (BuildContext contex, index) {
                      return FlowoutList(flowOut: state.flowOuts[index]);
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