import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:word_app/provider/bottom_navigation_bar_provider.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

const _rootPaths = {
  "/": 0,
  "/history": 1,
  "/saved": 2,
};

class RootApp extends StatelessWidget {
  const RootApp({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const RootAppTopBar(), backgroundColor: Colors.amber.shade400,),
      body: child,
      bottomNavigationBar: const BottomNavigationBar(),
    );
  }
}

class RootAppTopBar extends StatelessWidget {
  const RootAppTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
        'Word App ${context.watch<BottomNavigationBarProvider>().currentRouteString(_rootPaths, context)}');
  }
}

class BottomNavigationBar extends StatelessWidget {
  const BottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 20,
          color: Colors.amber.shade200,
        ),
        CurvedNavigationBar(
          height: 60,
          items: const <Widget>[
            Icon(Icons.add),
            Icon(Icons.history),
            Icon(Icons.save),
          ],
          color: Colors.amber.shade400,
          buttonBackgroundColor: Colors.white,
          backgroundColor: Colors.amber.shade200,
          animationDuration: const Duration(milliseconds: 300),
          index: context
              .watch<BottomNavigationBarProvider>()
              .currentRouteIndex(_rootPaths, context),
          onTap: (int idx) =>
              context.read<BottomNavigationBarProvider>().link(idx, _rootPaths, context),
        ),
      ],
    );
  }
}
