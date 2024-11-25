import 'package:arocs_controller/models/flowin/flow_in.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FlowinList extends StatelessWidget {
  const FlowinList({super.key, required this.flowIn});
  final FlowInModel flowIn;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 3),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: 0.5
          ),
          borderRadius: BorderRadius.circular(6)
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
                    DateFormat('dd/MM/yyyy').format(flowIn.flowInDate)
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Center(
                  child: Text(
                    "...${flowIn.flowInUID?.split('-').last}"
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Center(
                  child: Text(
                    flowIn.flowInQuantity.toString()
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Center(
                  child: Text(
                    flowIn.totalQuantity.toString()
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Center(
                  child: Text(
                    (flowIn.flowInStatus == FlowInStatus.waiting) ? 'Waiting' :
                    (flowIn.flowInStatus == FlowInStatus.ongoing) ? 'OnGoing' :
                    'Done'
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  color: (flowIn.flowInStatus == FlowInStatus.done) ? Colors.green :
                         (flowIn.flowInStatus == FlowInStatus.ongoing) ? Colors.yellow :
                          Colors.orange,
                ),
                height: 18,
                width: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}