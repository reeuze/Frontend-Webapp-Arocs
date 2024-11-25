import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:developer' as developer;

import 'inventory_model.dart';

class InventoryService {
  Future<List<InventoryModel>> getAllProducts() async {
    final url = Uri.parse('http://localhost:3000/products');
    // developer.log("try get all products");
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        // developer.log("success get all products");
        // developer.log('Raw data: ${response.body}');
        Map<String, dynamic> data = json.decode(response.body);
        List<dynamic> inventoryData = data['products'];
        developer.log('succes make var');
        final inventoryList = inventoryData
          .map((item) => InventoryModel.fromMap(item))
          .toList();
        // for (final inventory in inventoryList) {
        //   if (inventory.productOut != null && inventory.productOut!.isNotEmpty) {
        //     for (final product in inventory.productOut!) {
        //       developer.log('Product Out for ${inventory.itemName}: '
        //           'ID: ${product.id}, '
        //           'Arrived: ${product.sent}, '
        //           'Quantity: ${product.quantity}, '
        //           'Rack Location: ${product.rackLocation}, '
        //           'Expire: ${product.expire}');
        //     }
        //   } else {
        //     developer.log('Product Out for ${inventory.itemName}: No productIn details available');
        //   }
        // }
        return inventoryList;
      } else {
        throw Exception('Failed to load flow ins');
      }
    } catch (e) {
      throw Exception('Failed to load flow ins: $e');
    }
  }
  
}