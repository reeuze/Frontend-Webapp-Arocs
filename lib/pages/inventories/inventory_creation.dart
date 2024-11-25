import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

import 'package:arocs_controller/models/Inventories/inventory.dart';

class InventoryCreation extends StatefulWidget {
  const InventoryCreation({super.key});

  @override
  State<InventoryCreation> createState() => _InventoryCreationState();
}

class _InventoryCreationState extends State<InventoryCreation> {
  late TextEditingController _nameController, _instockController, _varianController, _stockMinimumController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _instockController = TextEditingController();
    _varianController = TextEditingController();
    _stockMinimumController = TextEditingController();
  }
  
  @override
  Widget build(BuildContext context) {
     return AlertDialog(
      title: const Text("Create New Item"),
      content: Column(
        // height: 100,
        mainAxisSize: MainAxisSize.min, 
        // child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Item Name',
                labelStyle: TextStyle(),
              )
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _instockController,
              decoration: const InputDecoration(
                labelText: 'Item In Stock',
                labelStyle: TextStyle(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _varianController,
              decoration: const InputDecoration(
                labelText: 'Item Varian',
                labelStyle: TextStyle(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _stockMinimumController,
              decoration: const InputDecoration(
                labelText: 'Item Stock Minimum',
                labelStyle: TextStyle(),
              ),
            ),
          ],
        // ),
      ),
      actions: [
        TextButton(
          child: const Text("Cancel"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const Text("Create"),
          onPressed: () {
            context.read<InventoryBloc>().add(InventoryCreationEvent(
              newItem: InventoryModel(
                itemUID: const Uuid().v4(),
                itemName: _nameController.text,
                itemInStock: _instockController.hashCode,
                itemVarian: _varianController.text,
                itemStockMinimum: _stockMinimumController.hashCode,
              )
            ));
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}