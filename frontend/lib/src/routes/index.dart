import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:word_app/store.dart';

import '../pages/about.dart';

class IndexRoute extends StatelessWidget {
  const IndexRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Home Page'),
        ElevatedButton(
          onPressed: () {
            Navigator.restorablePushNamed(context, AboutPage.pageName);
          },
          child: const Text('Go to About'),
        ),
        const CountDisplay(),
        ElevatedButton(
          onPressed: () {
            context.read<IndexRouteCount>().increment();
          },
          child: const Text('Increment with state'),
        ),
      ],
    );
  }
}

class CountDisplay extends StatelessWidget {
  const CountDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Count: ${context.watch<IndexRouteCount>().count}'),
    );
  }
}
