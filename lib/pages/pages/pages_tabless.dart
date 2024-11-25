import 'package:flutter/material.dart';
import 'package:arocs_controller/models/pages/pages.dart';

class PagesTabless extends StatelessWidget {
  const PagesTabless({super.key, required this.page});
  final PagesModel page;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: page.body,
    );
  }
}