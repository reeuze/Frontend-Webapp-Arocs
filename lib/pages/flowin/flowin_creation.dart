import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

import 'package:arocs_controller/models/flowin/flow_in.dart';

class FlowinCreation extends StatefulWidget {
  const FlowinCreation({super.key});

  @override
  State<FlowinCreation> createState() => _FlowinCreationState();
}

class _FlowinCreationState extends State<FlowinCreation> {
  late TextEditingController _countController;

  @override
  void initState() {
    super.initState();
    _countController = TextEditingController();
  }
  
  @override
  Widget build(BuildContext context) {
     return AlertDialog(
      title: const Text("New Item Flow In"),
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
            context
            .read<FlowInBloc>()
            .add(FlowInCreationEvent(
              newFlowIn: FlowInModel(
                flowInUID: const Uuid().v4(), 
                flowInQuantity: 0, 
                totalQuantity: int.parse(_countController.text), 
                flowInDate: DateTime.now(), 
                flowInStatus: FlowInStatus.waiting
                )
              )
            );
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}