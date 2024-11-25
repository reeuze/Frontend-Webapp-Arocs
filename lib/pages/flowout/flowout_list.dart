import 'package:arocs_controller/models/flowout/flow_out.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FlowoutList extends StatelessWidget {
  const FlowoutList({super.key, required this.flowOut});
  final FlowOutModel flowOut;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(width: 0.5),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                flex : 2,
                child: Center(
                  child: Text(
                    DateFormat('dd/MM/yyyy').format(flowOut.flowOutDate)
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Center(
                  child: Text(
                    "...${flowOut.flowOutUID.split('-').last}"
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Center(
                  child: Text(
                    flowOut.flowOutQuantity.toString()
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Center(
                  child: Text(
                    flowOut.totalQuantity.toString()
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Center(
                  child: Text(
                    (flowOut.flowOutStatus == FlowOutStatus.draft) ? 'draft' :
                    (flowOut.flowOutStatus == FlowOutStatus.on_progress) ? 'on progress' :
                    'Done'
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: (flowOut.flowOutStatus == FlowOutStatus.done) ? Colors.green :
                         (flowOut.flowOutStatus == FlowOutStatus.on_progress) ? Colors.yellow :
                         Colors.orange,
                  borderRadius: BorderRadius.circular(3)
                ),
                height: 18,
                width: 15,
              )
            ],
          ),
        ),
      ),
    );
  }
}