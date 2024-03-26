import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:word_app/store.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  static const pageName = '/about';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
        backgroundColor: Colors.blue,
      ),
      body: const Center(
        child: Text('About Page'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<AboutPageCount>().increment();
        },
        child: Text('${context.watch<AboutPageCount>().count}'),
      ),
    );
  }
}
