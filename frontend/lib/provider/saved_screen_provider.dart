import 'package:flutter/foundation.dart';
import 'package:word_app/models/saves.dart';

class SavedScreenProvider with ChangeNotifier, DiagnosticableTreeMixin {
  final List<SavesModel> _saves = [];

  List<SavesModel> get saves => _saves;

  void addSave(SavesModel newSave) {
    _saves.add(newSave);
    notifyListeners();
  }

  void removeSave(int index) {
    _saves.removeAt(index);
    notifyListeners();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IterableProperty<SavesModel>('saves', saves));
  }
}
