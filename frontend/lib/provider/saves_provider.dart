import 'package:flutter/foundation.dart';
import 'package:word_app/models/saves.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:uuid/uuid.dart';
import 'package:word_app/utils/logger.dart';

late List<SavesModel> initialSaves;

class SavesProvider with ChangeNotifier, DiagnosticableTreeMixin {
  final List<SavesModel> _saves = initialSaves;

  List<SavesModel> get saves => _saves;

  void addSave(String newWord) {
    final String id = const Uuid().v4();

    final SavesModel newSave = SavesModel(
      id: id,
      word: newWord,
    );

    logger.t([
      'New word saved',
      {'id': id, 'word': newWord}
    ]);

    _saves.add(newSave);

    hiveSave();
    notifyListeners();
  }

  void removeSave(int index) {
    logger.t([
      'Saved word removed',
      {'id': _saves[index].id, 'word': _saves[index].word}
    ]);

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
