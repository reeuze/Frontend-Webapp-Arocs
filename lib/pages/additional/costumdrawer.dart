import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:arocs_controller/models/pages/pages.dart';

class CostumDrawer extends StatefulWidget {
  const CostumDrawer({super.key});

  @override
  State<CostumDrawer> createState() => _CostumDrawerState();
}

class _CostumDrawerState extends State<CostumDrawer> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleDrawer() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    
    List<Widget> collapsedWidget = [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 6.0),
        child: IconButton(
          onPressed: (){
            _toggleDrawer();
          }, 
          icon: const Icon(Icons.menu)
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 6.0),
        child: IconButton(
          onPressed: (){
            context.read<PagesBloc>().add(ChangedDashboardEvent());
          }, 
          icon: const Icon(Icons.home)
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 6.0),
        child: IconButton(
          onPressed: (){
            context.read<PagesBloc>().add(ChangedMapEvent());
          }, 
          icon: const Icon(Icons.map)
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 6.0),
        child: IconButton(
          onPressed: (){
            context.read<PagesBloc>().add(ChangedInventoryEvent());
          }, 
          icon: const Icon(Icons.inventory)
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 6.0),
        child: IconButton(
          onPressed: (){
            context.read<PagesBloc>().add(ChangedFlowInEvent());
          }, 
          icon: const Icon(Icons.arrow_forward)
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 6.0),
        child: IconButton(
          onPressed: (){
            context.read<PagesBloc>().add(ChangedFlowOutEvent());
          }, 
          icon: const Icon(Icons.arrow_back)
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 6.0),
        child: IconButton(
          onPressed: (){
            context.read<PagesBloc>().add(ChangedRobotEvent());
          }, 
          icon: const Icon(Icons.bolt)
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 6.0),
        child: IconButton(
          onPressed: (){
            context.read<PagesBloc>().add(ChangedRobotManualEvent());
          }, 
          icon: const Icon(Icons.control_camera)
        ),
      ),
      const Spacer(),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 6.0),
        child: IconButton(
          onPressed: (){
            context.read<PagesBloc>().add(ChangedSettingEvent());
          }, 
          icon: const Icon(Icons.settings)
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 6.0),
        child: IconButton(
          onPressed: (){
            context.read<PagesBloc>().add(ChangedInfoEvent());
          }, 
          icon: const Icon(Icons.info)
        ),
      ),
    ];

    List<Widget> expandedWidget = [
      const DrawerHeader(child: Text('Arocs Project')),
      ListTile(
        leading: const Icon(Icons.home),
        title: const Text('Dashboard'),
        hoverColor: const Color.fromARGB(255, 125, 173, 255),
        onTap: () {
          context.read<PagesBloc>().add(ChangedDashboardEvent());
          _toggleDrawer();
        },
      ),
      ListTile(
        leading: const Icon(Icons.map),
        title: const Text('Maps'),
        hoverColor: const Color.fromARGB(255, 125, 173, 255),
        onTap: () {
          context.read<PagesBloc>().add(ChangedMapEvent());
          _toggleDrawer();
        },
      ),
      ListTile(
        leading: const Icon(Icons.inventory),
        title: const Text('Inventory'),
        hoverColor: const Color.fromARGB(255, 125, 173, 255),
        onTap: () {
          context.read<PagesBloc>().add(ChangedInventoryEvent());
          _toggleDrawer();
        },
      ),
      ListTile(
        leading: const Icon(Icons.arrow_forward),
        title: const Text('Flow In'),
        hoverColor: const Color.fromARGB(255, 125, 173, 255),
        onTap: () {
          context.read<PagesBloc>().add(ChangedFlowInEvent());
          _toggleDrawer();
        },
      ),
      ListTile(
        leading: const Icon(Icons.arrow_back),
        title: const Text('Flow Out'),
        hoverColor: const Color.fromARGB(255, 125, 173, 255),
        onTap: () {
          context.read<PagesBloc>().add(ChangedFlowOutEvent());
          _toggleDrawer();
        },
      ),
      ListTile(
        leading: const Icon(Icons.bolt),
        title: const Text('Robot'),
        hoverColor: const Color.fromARGB(255, 125, 173, 255),
        onTap: () {
          context.read<PagesBloc>().add(ChangedRobotEvent());
          _toggleDrawer();
        },
      ),
      ListTile(
        leading: const Icon(Icons.control_camera),
        title: const Text('Robot Manual'),
        hoverColor: const Color.fromARGB(255, 125, 173, 255),
        onTap: () {
          context.read<PagesBloc>().add(ChangedRobotManualEvent());
          _toggleDrawer();
        },
      ),
      const Spacer(),
      ListTile(
        leading: const Icon(Icons.settings),
        title: const Text('Settings'),
        hoverColor: const Color.fromARGB(255, 125, 173, 255),
        onTap: () {
          context.read<PagesBloc>().add(ChangedSettingEvent());
          _toggleDrawer();
        },
      ),
      ListTile(
        leading: const Icon(Icons.info),
        title: const Text('About'),
        hoverColor: const Color.fromARGB(255, 125, 173, 255),
        onTap: () {
          context.read<PagesBloc>().add(ChangedInfoEvent());
          _toggleDrawer();
        },
      ),
    ];

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Container(
          width: _isExpanded ? 100 * _controller.value + 150 : 50,
          // `width: _isExpanded ? 250 : 50,
          decoration: BoxDecoration(
            color: Color.lerp(Colors.white, const Color.fromARGB(255, 255, 255, 255), _controller.value) ?? Colors.white,
          ),
          child:  Column(
            children: _isExpanded ? expandedWidget : collapsedWidget,
          ),
        );
      },
    );
  }
}
