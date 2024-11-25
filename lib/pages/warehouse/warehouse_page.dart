import 'package:flutter/material.dart';

import 'warehouse_map.dart';

class WarehousePage extends StatelessWidget {
  const WarehousePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          flex: 7,
          child: WarehouseMap()
        ),
        Expanded(
          flex: 3,
          child: Column(
            children: [
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  // do something
                }, 
                child: const Text('Submit'),
              ),
              const SizedBox(height: 30,)
            ],
          )
        ),
      ],
    );
  }
}
