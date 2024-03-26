import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:word_app/store.dart';

import '../pages/index/add.dart';
import '../pages/index/history.dart';
import '../pages/index/saves.dart';

class IndexRoute extends StatelessWidget {
  const IndexRoute({super.key});

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Word App - by realSkyQuest'),
        backgroundColor: Colors.redAccent,
      ),
      body: const IndexPages(),
      bottomNavigationBar: const IndexPagesBottomNavigationBar(),
    );
  }
}

class IndexPagesBottomNavigationBar extends StatelessWidget {
  const IndexPagesBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add'),
        BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
        BottomNavigationBarItem(
            icon: Icon(Icons.manage_history), label: 'Saved'),
      ],
      currentIndex:
          context.watch<IndexRouteBottomNavigationBarState>().currentPage,
      onTap: (int index) {
        context.read<IndexRouteBottomNavigationBarState>().newPage(index);
      },
    );
  }
}

class IndexPages extends StatelessWidget {
  const IndexPages({super.key});

  @override
  Widget build(BuildContext context) {
    switch (context.watch<IndexRouteBottomNavigationBarState>().currentPage) {
      case 0:
        return const AddPage();
      case 1:
        return const HistoryPage();
      case 2:
        return const SavesPage();
      default:
        return const AddPage();
    }
  }
}
