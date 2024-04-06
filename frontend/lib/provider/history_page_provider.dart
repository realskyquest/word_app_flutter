import 'package:flutter/foundation.dart';

class HistoryPageProvider with ChangeNotifier, DiagnosticableTreeMixin {
  final List<String> _list = <String>[];

  List<String> get list => _list;

  void addWord(String newWord) {
    _list.add(newWord);
    notifyListeners();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IterableProperty<String>('history', list));
  }
}