import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:word_app/store.dart';

class AboutRoute extends StatelessWidget {
  const AboutRoute({super.key});

  static const routeName = '/about';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About | Word App'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: [
          const Text('About Route'),
          ElevatedButton(
              onPressed: () {
                context.read<AboutPageCount>().increment();
              },
              child: Text('${context.watch<AboutPageCount>().count}')),
        ],
      ),
    );
  }
}
