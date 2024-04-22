import 'package:flutter/foundation.dart';

class AddProvider with ChangeNotifier, DiagnosticableTreeMixin {
  String _word = '';

  String get word => _word;

  void setWord(String newWord) {
    _word = newWord;
    notifyListeners();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('word', word));
  }
}