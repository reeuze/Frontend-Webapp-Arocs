import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:arocs_controller/models/Inventories/inventory.dart';
import 'package:arocs_controller/models/pages/pages.dart';

import 'inventories_description/description.dart';

class InventoryList extends StatelessWidget {
  const InventoryList({super.key, required this.item});
  final InventoryModel item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context
        .read<PagesBloc>()
        .add(PagesCreatedEvent(
          page: PagesModel(
            body: DescriptionPage(item: item), 
            title: "Product Info: ${item.itemName}"
            )
          )
        );

      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 3, horizontal: 24),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 0.5),
          borderRadius: BorderRadius.circular(6)
        ),
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                flex: 2,
                child: Center(
                  child: Text(
                    "...${item.itemUID.split('-').last}"
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Center(
                  child: Text(
                    item.itemName
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Center(
                  child: Text(
                    item.itemVarian
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Center(
                  child: Text(
                    item.itemStockMinimum.toString()
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Center(
                  child: Text(
                    item.itemInStock.toString()
                  ),
                ),
              ),
              Container(
                height: 24,
                width: 16,
                decoration: BoxDecoration(
                  color: (item.itemInStock >= item.itemStockMinimum) ? Colors.green : Colors.red,
                  borderRadius: BorderRadius.circular(3)
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}