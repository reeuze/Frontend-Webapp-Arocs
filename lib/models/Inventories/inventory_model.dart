class InventoryModel {
  final String itemUID;
  final String itemName;
  final int itemInStock;
  final int itemStockMinimum;
  final String itemVarian;
  final List<ProductIn>? productIn;
  final List<ProductOut>? productOut;

  InventoryModel({
    required this.itemUID,
    required this.itemName,
    required this.itemInStock,
    required this.itemStockMinimum,
    required this.itemVarian,
    this.productIn,
    this.productOut,
  });

  factory InventoryModel.fromMap(Map<String, dynamic> data) {
    return InventoryModel(
      itemUID: data['id'] ?? '',
      itemName: data['name'] ?? '',
      itemInStock: data['in_stock'] ?? 0,
      itemStockMinimum: data['stock_minimum'] ?? 0,
      itemVarian: data['varian'] ?? '',
      productIn: data['stock_detail_in'] != null
        ? (data['stock_detail_in'] as List<dynamic>)
            .map((item) => ProductIn.fromMap(item))
            .toList()
        : [],
      productOut: data['stock_detail_out'] != null
        ? (data['stock_detail_out'] as List<dynamic>)
            .map((item) => ProductOut.fromMap(item))
            .toList()
        : [],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': itemUID,
      'name': itemName,
      'in_stock': itemInStock,
      'stock_minimum': itemStockMinimum,
      'varian': itemVarian,
      'stock_detail_in': productIn?.map((item) => item.toMap()).toList(),
      'stock_detail_out': productOut?.map((item) => item.toMap()).toList(),
    };
  }

  InventoryModel copyWith({
    String? itemUID,
    String? itemName,
    int? itemInStock,
    int? itemStockMinimum,
    String? itemVarian,
    String? itemLocation,
    List<ProductIn>? productIn,
    List<ProductOut>? productOut,
  }) {
    return InventoryModel(
      itemUID: itemUID ?? this.itemUID,
      itemName: itemName ?? this.itemName,
      itemInStock: itemInStock ?? this.itemInStock,
      itemStockMinimum: itemStockMinimum ?? this.itemStockMinimum,
      itemVarian: itemVarian ?? this.itemVarian,
      productIn: productIn ?? this.productIn,
      productOut: productOut ?? this.productOut,
    );
  }
}

class ProductIn {
  final String id;
  final int arrived;
  final DateTime? deadline;
  final DateTime expire;
  final int quantity;
  final String rackLocation;

  ProductIn({
    required this.arrived,
    this.deadline,
    required this.expire,
    required this.id,
    required this.quantity,
    required this.rackLocation,
  });

  factory ProductIn.fromMap(Map<String, dynamic> data) {
    return ProductIn(
      arrived: data['arrived'],
      deadline: data['deadline'].isNotEmpty ? DateTime.tryParse(data['deadline']) : null,
      expire: DateTime.parse(data['expire']),
      id: data['id'],
      quantity: data['quantity'],
      rackLocation: data['rack_location'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'arrived': arrived,
      'deadline': deadline?.toIso8601String() ?? '',
      'expire': expire.toIso8601String(),
      'id': id,
      'quantity': quantity,
      'location': rackLocation,
    };
  }
}

class ProductOut {
  final String id;
  final int sent;
  final DateTime? deadline;
  final DateTime expire;
  final int quantity;
  final String rackLocation;

  ProductOut({
    required this.sent,
    this.deadline,
    required this.expire,
    required this.id,
    required this.quantity,
    required this.rackLocation,
  });

  factory ProductOut.fromMap(Map<String, dynamic> data) {
    return ProductOut(
      sent: data['sent'],
      deadline: data['deadline'].isNotEmpty ? DateTime.tryParse(data['deadline']) : null,
      expire: DateTime.parse(data['expire']),
      id: data['id'],
      quantity: data['quantity'],
      rackLocation: data['location'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'sent': sent,
      'deadline': deadline?.toIso8601String() ?? '',
      'expire': expire.toIso8601String(),
      'id': id,
      'quantity': quantity,
      'location': rackLocation,
    };
  }
}