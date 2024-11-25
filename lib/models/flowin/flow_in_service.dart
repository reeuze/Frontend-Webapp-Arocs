import 'dart:convert';
// import 'dart:developer' as developer;
import 'package:http/http.dart' as http;
import 'flow_in_model.dart';

class FlowInService {
  Future<List<FlowInModel>> getAllFlowIn() async {
    final url = Uri.parse('http://localhost:3000/flow_in');
    // developer.log("try get all flow_in");
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        // developer.log("success get all flow in");
        // developer.log('Raw data: ${response.body}');
        Map<String, dynamic> data = json.decode(response.body);
        List<dynamic> flowInData = data['flow_in'];
        List<FlowInModel> flowInList = [];
        for (var flowInItem in flowInData) {
          int totalArrived = 0;
          int totalQuantity = 0;

          // Ensure 'product_in' exists and is a list
          if (flowInItem['product_in'] != null) {
            for (var product in flowInItem['product_in']) {
              totalArrived += (product['arrived'] ?? 0) as int;
              totalQuantity += (product['quantity'] ?? 0) as int;
            }
          }

          // Create FlowInModel objects
          flowInList.add(FlowInModel(
            flowInUID: flowInItem['id'],
            flowInQuantity: totalArrived,
            totalQuantity: totalQuantity,
            flowInDate: DateTime.parse(flowInItem['scheduled_arrived']),
            flowInStatus: FlowInStatus.values.firstWhere(
              (status) => status.toString().split('.').last == flowInItem['status'],
              orElse: () => FlowInStatus.waiting,
            ),
          ));
        }
        // for (var flowIn in flowInList) {
        //   developer.log(
        //     'FlowIn: ID=${flowIn.flowInUID}, Quantity=${flowIn.flowInQuantity}, Total=${flowIn.totalQuantity}, Date=${flowIn.flowInDate}, Status=${flowIn.flowInStatus}',
        //     name: 'FlowInService',
        //   );
        // }
        return flowInList;
      } else {
        throw Exception('Failed to load flow ins');
      }
    } catch (e) {
      throw Exception('Failed to load flow ins: $e');
    }
  }
}