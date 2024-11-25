enum FlowOutStatus { draft, on_progress, done }

class FlowOutModel {
  final String flowOutUID;
  final DateTime flowOutDate;
  final FlowOutStatus flowOutStatus;

  final int? flowOutQuantity;
  final int? totalQuantity;

  FlowOutModel({
    required this.flowOutUID,
    required this.flowOutDate,
    required this.flowOutStatus,

    this.flowOutQuantity,
    this.totalQuantity,
  });

  factory FlowOutModel.fromMap(Map<String, dynamic> data) {
    return FlowOutModel(
      flowOutUID: data['id'],
      flowOutDate: DateTime.parse(data['deadline_sent']),
      flowOutStatus: FlowOutStatus.values.firstWhere(
        (status) => status.toString().split('.').last == data['status'],
      ),

      // flowOutQuantity: data['flowOutQuantity'],
      // totalQuantity: data['totalQuantity'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': flowOutUID,
      'deadline_sent': flowOutDate.toIso8601String(),
      'status': flowOutStatus.toString().split('.').last,
      // 'flowOutQuantity': flowOutQuantity,
      // 'totalQuantity': totalQuantity,
    };
  }

  FlowOutModel copyWith({
    String? flowOutUID,
    DateTime? flowOutDate,
    FlowOutStatus? flowOutStatus,
    int? flowOutQuantity,
    int? totalQuantity,
  }) {
    return FlowOutModel(
      flowOutUID: flowOutUID ?? this.flowOutUID,
      flowOutDate: flowOutDate ?? this.flowOutDate,
      flowOutStatus: flowOutStatus ?? this.flowOutStatus,
      flowOutQuantity: flowOutQuantity ?? this.flowOutQuantity,
      totalQuantity: totalQuantity ?? this.totalQuantity,
    );
  }
}

class ProductOut {
  final int arrived;
  // final String? collectionId;
  // final String? collectionName;
  // final DateTime created;
  final DateTime? deadline;
  final DateTime expire;
  final String id;
  final int quantity;
  final String rackLocation;
  // final DateTime updated;

  ProductOut({
    required this.arrived,
    // this.collectionId,
    // this.collectionName,
    // required this.created,
    this.deadline,
    required this.expire,
    required this.id,
    required this.quantity,
    required this.rackLocation,
    // required this.updated,
  });

  factory ProductOut.fromMap(Map<String, dynamic> data) {
    return ProductOut(
      arrived: data['arrived'],
      // collectionId: data['collectionId'],
      // collectionName: data['collectionName'],
      // created: DateTime.parse(data['created']),
      deadline: data['deadline'].isNotEmpty ? DateTime.tryParse(data['deadline']) : null,
      expire: DateTime.parse(data['expire']),
      id: data['id'],
      quantity: data['quantity'],
      rackLocation: data['rack_location'],
      // updated: DateTime.parse(data['updated']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'arrived': arrived,
      // 'collectionId': collectionId,
      // 'collectionName': collectionName,
      // 'created': created.toIso8601String(),
      'deadline': deadline?.toIso8601String() ?? '',
      'expire': expire.toIso8601String(),
      'id': id,
      'quantity': quantity,
      'rack_location': rackLocation,
      // 'updated': updated.toIso8601String(),
    };
  }
}
