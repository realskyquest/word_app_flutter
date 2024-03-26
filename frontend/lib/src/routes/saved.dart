import 'package:flutter/material.dart';

class SavedRoute extends StatelessWidget {
  const SavedRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Saved Page'),
        ElevatedButton(
          onPressed: () {
          },
          child: const Text('Go to hell'),
        ),
      ],
    );
  }
}
