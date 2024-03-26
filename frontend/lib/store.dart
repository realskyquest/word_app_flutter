import 'package:flutter/material.dart';

class BottomNavigationBarProvider extends ChangeNotifier {
  int _currentRoute = 0;

  int get currentRoute => _currentRoute;

  void newRoute(int route) {
    _currentRoute = route;
    notifyListeners();
  }
}

// EXTRA

class IndexRouteCount extends ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}

class AboutPageCount extends ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}