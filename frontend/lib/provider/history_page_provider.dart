import 'package:flutter/foundation.dart';

class HistoryPageProvider with ChangeNotifier, DiagnosticableTreeMixin {
  final List<String> _list = <String>[];

  get list => _list;

  void addWord(String newWord) {
    _list.add(newWord);
    notifyListeners();
  }

  // Take care of later
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty('history', list));
  }
}