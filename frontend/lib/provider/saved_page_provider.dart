import 'package:flutter/foundation.dart';

class SavedPageProvider with ChangeNotifier, DiagnosticableTreeMixin {
  final List<String> _list = <String>[];

  List<String> get list => _list;

  void addWord(String newWord) {
    _list.add(newWord);
    notifyListeners();
  }

  void removeWord(int index) {
    _list.removeAt(index);
    notifyListeners();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IterableProperty<String>('saved', list));
  }
}