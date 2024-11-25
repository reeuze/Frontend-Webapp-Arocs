import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:arocs_controller/models/warehouse/warehouse.dart';

class WarehouseTile extends StatelessWidget {
  const WarehouseTile({super.key, required this.tile, required this.columnIndex, required this.rowIndex});
  final TileModel tile;
  final int columnIndex;
  final int rowIndex;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<WarehouseBloc>().add(WarehouseUpdateTileEvent(
            columnIndex: columnIndex, 
            rowIndex: rowIndex, 
            updatedTile: TileModel(arucoId: tile.arucoId, isPath: tile.isPath == 0 ? 1 : 0) 
          )
        );
      },
      child: Container(
        color: (tile.isPath == 0) 
        ? Colors.blueAccent 
        : Colors.blueGrey,
        child: (tile.isPath == 0) 
        ? Column(
          children: [
            Expanded(
              flex: 6
              ,
              child: Center(child: Text(tile.arucoId.toString()))
              ),
            Expanded(
              flex: 4,
              child: IconButton(
                onPressed: () {
              
                }, 
                icon: const Icon(
                  Icons.edit,
                  size: 12,
                )
              ),
            )
          ],
        ) : null,
      ),
    );
  }
}   