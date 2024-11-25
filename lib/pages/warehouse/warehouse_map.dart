import 'package:arocs_controller/pages/warehouse/warehouse_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:arocs_controller/models/warehouse/warehouse.dart';

class WarehouseMap extends StatefulWidget {
  const WarehouseMap({super.key, this.updateable = true});
  final bool updateable;

  @override
  _WarehouseMapState createState() => _WarehouseMapState();
}

class _WarehouseMapState extends State<WarehouseMap> {
  late ScrollController _verticalController;
  late ScrollController _horizontalController;

  @override
  void initState() {
    super.initState();
    _verticalController = ScrollController();
    _horizontalController = ScrollController();
  }

  @override
  void dispose() {
    _verticalController.dispose();
    _horizontalController.dispose();
    super.dispose();
  }

  void _scrollLeft() {
    _horizontalController.animateTo(
      _horizontalController.offset - 100,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  void _scrollRight() {
    _horizontalController.animateTo(
      _horizontalController.offset + 100,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  void _scrollUp() {
    _verticalController.animateTo(
      _verticalController.offset - 100,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  void _scrollDown() {
    _verticalController.animateTo(
      _verticalController.offset + 100,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WarehouseBloc, WarehouseState>(
      builder: (context, state) {
        if (state is WarehouseLoaded) {
          final newList = state.model.maps.expand((list) => list).toList();

          return Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    // Left scroll button
                    IconButton(
                      icon: const Icon(Icons.arrow_left),
                      onPressed: _scrollLeft,
                    ),
                    Expanded(
                      flex: 8,
                      child: Column(
                        children: [
                          // Up scroll button
                          IconButton(
                            icon: const Icon(Icons.arrow_drop_up),
                            onPressed: _scrollUp,
                          ),
                          // Grid view with scrollable area
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Scrollbar(
                                controller: _verticalController,
                                child: SingleChildScrollView(
                                  controller: _verticalController,
                                  scrollDirection: Axis.vertical,
                                  child: SingleChildScrollView(
                                    controller: _horizontalController,
                                    scrollDirection: Axis.horizontal,
                                    child: SizedBox(
                                      width: state.model.columns * 80,
                                      height: state.model.rows * 80,
                                      child: GridView.builder(
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: state.model.columns,
                                          crossAxisSpacing: 4,
                                          mainAxisSpacing: 4,
                                          childAspectRatio: 1,
                                        ),
                                        itemCount:
                                            state.model.columns * state.model.rows,
                                        itemBuilder: (context, index) {
                                          final columnIndex = index % state.model.columns;
                                          final rowIndex = index ~/ state.model.columns;
                                          return WarehouseTile(tile: newList[index], columnIndex: columnIndex, rowIndex: rowIndex);
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // Down scroll button
                          IconButton(
                            icon: const Icon(Icons.arrow_drop_down),
                            onPressed: _scrollDown,
                          ),
                          // Additional button at the bottom
                          widget.updateable ? IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: () {
                              context.read<WarehouseBloc>().add(WarehouseExpandYEvent());
                            },
                          ) : Container(),
                        ],
                      ),
                    ),
                    // Right scroll button
                    IconButton(
                      icon: const Icon(Icons.arrow_right),
                      onPressed: _scrollRight,
                    ),
                    // Additional button on the right
                    widget.updateable ? IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        context.read<WarehouseBloc>().add(WarehouseExpandXEvent());
                      },
                    ) : Container(),
                  ],
                ),
              ),
            ],
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
