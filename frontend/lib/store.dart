import 'package:flutter/material.dart';

class IndexRouteBottomNavigationBarState extends ChangeNotifier {
  int _currentPage = 0;

  int get currentPage => _currentPage;

  void newPage(int route) {
    _currentPage = route;
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