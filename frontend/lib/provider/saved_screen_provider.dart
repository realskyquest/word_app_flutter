import 'package:flutter/foundation.dart';
import 'package:word_app/models/saves.dart';
import 'package:hive_flutter/adapters.dart';

late List<SavesModel> initialSaves;

class SavedScreenProvider with ChangeNotifier, DiagnosticableTreeMixin {
  final List<SavesModel> _saves = initialSaves;

  List<SavesModel> get saves => _saves;

  void addSave(SavesModel newSave) {
    _saves.add(newSave);
    hiveSave();
    notifyListeners();
  }

  void removeSave(int index) {
    _saves.removeAt(index);
    hiveSave();
    notifyListeners();
  }

  void hiveSave() async {
    var box = await Hive.openBox('saves');
    await box.put('list', _saves);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IterableProperty<SavesModel>('saves', saves));
  }
}
