import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

/// The home screen
class SavedPage extends StatelessWidget {
  const SavedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Saved'),
      ),
    );
  }
}
