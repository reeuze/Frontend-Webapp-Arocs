import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:arocs_controller/models/pages/pages.dart';
import 'package:arocs_controller/pages/additional/costumdrawer.dart';
import 'package:arocs_controller/pages/pages/pages.dart';
import 'additional/additional.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});
  final List<GlobalKey<PagesTabfullState>> _keys = [
    GlobalKey<PagesTabfullState>(),
    GlobalKey<PagesTabfullState>(),
    GlobalKey<PagesTabfullState>(),
    GlobalKey<PagesTabfullState>(),
    GlobalKey<PagesTabfullState>(),
    GlobalKey<PagesTabfullState>(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PagesBloc, PagesState>(
      builder: (context, state) {
        if(state is PagesLoading || state is PagesInitial){
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is PagesLoaded){
          return Scaffold(
            body: Row(
              children: [
                const CostumDrawer(),
                Expanded(
                  child: (state.loaded == 1 || state.loaded == 2 || state.loaded == 3 || state.loaded == 4 || state.loaded == 5) 
                    ? PagesTabfull(key: _keys[state.loaded], pages: state.pages) 
                    : PagesTabless(page: state.pages[0]),
                ),
              ],
            ),
          );
        }
        return const Center(
          child: Text( 'Wait a Second'),
        );
      },
    );
  }
}
