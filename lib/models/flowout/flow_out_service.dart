import 'dart:convert';
// import 'dart:developer' as developer;
import 'package:http/http.dart' as http;
import 'flow_out_model.dart';

class FlowOutService {
  Future<List<FlowOutModel>> getAllFlowOut() async {
    final url = Uri.parse('http://localhost:3000/flow_out');
    // developer.log("try get all flow_in");
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);
        List<dynamic> flowOutData = data['flow_out'];
        List<FlowOutModel> flowOutList = [];
        for (var flowOutItem in flowOutData) {
          int totalSent = 0;
          int totalQuantity = 0;

          // Ensure 'product_in' exists and is a list
          if (flowOutItem['product_out'] != null) {
            for (var product in flowOutItem['product_out']) {
              totalSent += (product['sent'] ?? 0) as int;
              totalQuantity += (product['quantity'] ?? 0) as int;
            }
          }
          // Create FlowInModel objects
          flowOutList.add(FlowOutModel(
            flowOutUID: flowOutItem['id'],
            flowOutQuantity: totalSent,
            totalQuantity: totalQuantity,
            flowOutDate: DateTime.parse(flowOutItem['deadline_sent']),
            flowOutStatus: FlowOutStatus.values.firstWhere(
              (status) => status.toString().split('.').last == flowOutItem['status'],
              orElse: () => FlowOutStatus.draft,
            ),
          ));
        }
        return flowOutList;
      } else {
        throw Exception('Failed to load flow ins');
      }
    } catch (e) {
      throw Exception('Failed to load flow ins: $e');
    }
  }
}