import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:word_app/store.dart';

// MainPage routing
import '../routes/index.dart';
import '../routes/history.dart';
import '../routes/saved.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  static const pageName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Word App'),
        backgroundColor: Colors.redAccent,
      ),
      body: const Layout(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
          BottomNavigationBarItem(
              icon: Icon(Icons.manage_history), label: 'Saved'),
        ],
        currentIndex: context.watch<BottomNavigationBarProvider>().currentRoute,
        onTap: (int index) {
          context.read<BottomNavigationBarProvider>().newRoute(index);
        },
      ),
    );
  }
}

class Layout extends StatelessWidget {
  const Layout({super.key});

  @override
  Widget build(BuildContext context) {
    switch (context.watch<BottomNavigationBarProvider>().currentRoute) {
      case 0:
        return const IndexRoute();
      case 1:
        return const HistoryRoute();
      case 2:
        return const SavedRoute();
      default:
        return const IndexRoute();
    }
  }
}