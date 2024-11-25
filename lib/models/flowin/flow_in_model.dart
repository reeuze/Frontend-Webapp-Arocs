enum FlowInStatus { waiting, ongoing, done }

class FlowInModel {
  final String? collectionId;
  final String? collectionName;
  final DateTime? created;
  final DateTime? updated;

  final String? flowInUID;
  final DateTime flowInDate;
  final int? flowInQuantity;
  final int? totalQuantity;
  final FlowInStatus flowInStatus;

  final String? name;
  final String? vendorName;
  final String? contactVendor;
  final List<ProductIn>? productIn;

  FlowInModel({
    this.collectionId,
    this.collectionName,
    this.created,
    this.updated,

    this.flowInUID,
    required this.flowInDate,
    this.flowInQuantity,
    this.totalQuantity,
    required this.flowInStatus,

    this.name,
    this.vendorName,
    this.contactVendor,
    this.productIn,
  });

  factory FlowInModel.fromMap(Map<String, dynamic> data) {
    return FlowInModel(
      collectionId: data['collectionId'],
      collectionName: data['collectionName'],
      contactVendor: data['contact_vendor'],
      created: DateTime.parse(data['created']),
      flowInUID: data['id'],
      name: data['name'],
      productIn: (data['product_in'] as List)
          .map((item) => ProductIn.fromMap(item))
          .toList(),
      flowInDate: DateTime.parse(data['scheduled_arrived']),
      flowInStatus: FlowInStatus.values.firstWhere(
        (status) => status.toString().split('.').last == data['status'],
      ),
      updated: DateTime.parse(data['updated']),
      vendorName: data['vendor_name'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': flowInUID,
      'flowInQuantity': flowInQuantity,
      'totalQuantity': totalQuantity,
      'scheduled_arrived': flowInDate.toIso8601String(),
      'status': flowInStatus.toString().split('.').last,
    };
  }

  FlowInModel copyWith({
    String? collectionId,
    String? collectionName,
    String? contactVendor,
    DateTime? created,
    String? id,
    String? name,
    List<ProductIn>? productIn,
    DateTime? scheduledArrived,
    String? status,
    DateTime? updated,
    String? vendorName,
    Map<String, dynamic>? data,
  }) {
    return FlowInModel(
      collectionId: collectionId ?? this.collectionId,
      collectionName: collectionName ?? this.collectionName,
      contactVendor: contactVendor ?? this.contactVendor,
      created: created ?? this.created,
      flowInUID: id ?? flowInUID,
      name: name ?? this.name,
      productIn: productIn ?? this.productIn,
      flowInDate: scheduledArrived ?? flowInDate,
      flowInStatus: FlowInStatus.values.firstWhere(
        (status) => status.toString().split('.').last == data?['status'],
      ),
      updated: updated ?? this.updated,
      vendorName: vendorName ?? this.vendorName,
    );
  }
}


class ProductIn {
  final int arrived;
  final String? collectionId;
  final String? collectionName;
  final DateTime created;
  final DateTime? deadline;
  final DateTime expire;
  final String id;
  final int quantity;
  final String rackLocation;
  final DateTime updated;

  ProductIn({
    required this.arrived,
    this.collectionId,
    this.collectionName,
    required this.created,
    this.deadline,
    required this.expire,
    required this.id,
    required this.quantity,
    required this.rackLocation,
    required this.updated,
  });

  factory ProductIn.fromMap(Map<String, dynamic> data) {
    return ProductIn(
      arrived: data['arrived'],
      collectionId: data['collectionId'],
      collectionName: data['collectionName'],
      created: DateTime.parse(data['created']),
      deadline: data['deadline'].isNotEmpty ? DateTime.tryParse(data['deadline']) : null,
      expire: DateTime.parse(data['expire']),
      id: data['id'],
      quantity: data['quantity'],
      rackLocation: data['rack_location'],
      updated: DateTime.parse(data['updated']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'arrived': arrived,
      'collectionId': collectionId,
      'collectionName': collectionName,
      'created': created.toIso8601String(),
      'deadline': deadline?.toIso8601String() ?? '',
      'expire': expire.toIso8601String(),
      'id': id,
      'quantity': quantity,
      'rack_location': rackLocation,
      'updated': updated.toIso8601String(),
    };
  }
}

