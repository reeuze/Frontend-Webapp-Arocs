import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

import 'package:arocs_controller/models/flowout/flow_out.dart';

class FlowoutCreation extends StatefulWidget {
  const FlowoutCreation({super.key});

  @override
  State<FlowoutCreation> createState() => _FlowoutCreationState();
}

class _FlowoutCreationState extends State<FlowoutCreation> {
  late TextEditingController _countController;

  @override
  void initState() {
    super.initState();
    _countController = TextEditingController();
  }
  
  @override
  Widget build(BuildContext context) {
     return AlertDialog(
      title: const Text("Create New Item"),
      content: Column(
        children: [
          TextField(
            controller: _countController,
            decoration: const InputDecoration(
              labelText: 'Item Name',
              labelStyle: TextStyle(),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          child: const Text("Cancel"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const Text("Create"),
          onPressed: () {
            context.read<FlowOutBloc>().add(FlowOutCreationEvent(newFlowOut: FlowOutModel(flowOutUID: const Uuid().v4(), flowOutQuantity: 0, totalQuantity: int.parse(_countController.text), flowOutDate: DateTime.now(), flowOutStatus: FlowOutStatus.draft)));
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}