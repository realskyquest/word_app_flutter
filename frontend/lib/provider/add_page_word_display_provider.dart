import 'package:flutter/foundation.dart';

class AddPageWordDisplayProvider with ChangeNotifier, DiagnosticableTreeMixin {
  String _word = '';

  get word => _word;

  void setWord(String newWord) {
    _word = newWord;
    notifyListeners();
  }

  // Take care of later
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty('word', word));
  }
}