enum RobotStatus { ready, working, unavailable }

class RobotModel {
  final String robotUid;
  final RobotStatus robotStatus;

  RobotModel(
    {
      required this.robotUid,
      required this.robotStatus,
    }
  );

  factory RobotModel.fromMap(Map<String, dynamic> data) {
    return RobotModel(
      robotUid: data['id'],
      robotStatus: RobotStatus.values.firstWhere(
          (status) => status.toString().split('.').last == data['status']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': robotUid,
      'status': robotStatus.toString().split('.').last,
    };
  }

  RobotModel copyWith(
    {
      String? robotUid,
      RobotStatus? robotStatus,
      Map<String, dynamic>? data,
    }
  ) {
    return RobotModel(
      robotUid: robotUid ?? this.robotUid,
      robotStatus: RobotStatus.values.firstWhere(
        (status) => status.toString().split('.').last == data?['status'],
      ),
    );
  }
}

