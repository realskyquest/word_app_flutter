import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

/// The home screen
class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('History'),
      ),
    );
  }
}
