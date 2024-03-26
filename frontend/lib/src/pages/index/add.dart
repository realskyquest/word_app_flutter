import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:word_app/store.dart';

import 'package:word_app/src/routes/about.dart';

class AddPage extends StatelessWidget {
  const AddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Add page'),
        ElevatedButton(
          onPressed: () {
            Navigator.restorablePushNamed(context, AboutRoute.routeName);
          },
          child: const Text('Go to about route'),
        ),
        const CountComponent(),
      ],
    );
  }
}

class CountComponent extends StatelessWidget {
  const CountComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            title: const Text('Count'),
            subtitle: Badge(
              label: Text('${context.watch<IndexRouteCount>().count}'),
              child: const Text('This counter has state management'),
            ),
          ),
          FilledButton(
            onPressed: () {
              context.read<IndexRouteCount>().increment();
            },
            child: const Text('Increment'),
          ),
        ],
      ),
    );
  }
}
