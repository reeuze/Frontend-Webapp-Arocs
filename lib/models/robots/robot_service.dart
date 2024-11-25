import 'dart:convert';
// import 'dart:developer' as developer;
import 'package:http/http.dart' as http;
import 'robot_model.dart';

class RobotService {
  Future<List<RobotModel>> getAllRobots() async {
    final url = Uri.parse('http://localhost:3000/robot_allocation');
    // developer.log("try get all flow_in");
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        // developer.log("success get all flow in");
        // developer.log('Raw data: ${response.body}');
        Map<String, dynamic> data = json.decode(response.body);
        List<dynamic> robotData = data['robot_allocation'];
        List<RobotModel> robotList = [];
        for (var robotStatus in robotData) {
          robotList.add(RobotModel(
            robotUid: robotStatus['id'],
            robotStatus: RobotStatus.values.firstWhere(
              (status) => status.toString().split('.').last == robotStatus['status'],
              orElse: () => RobotStatus.unavailable,
            ),
          ));
        }
        return robotList;
      } else {
        throw Exception('Failed to load flow ins');
      }
    } catch (e) {
      throw Exception('Failed to load flow ins: $e');
    }
  }
}