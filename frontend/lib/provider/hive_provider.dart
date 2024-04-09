import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';

class HiveProvider with ChangeNotifier, DiagnosticableTreeMixin {
  Directory? _dir;

  Directory? get dir => _dir;

  void init() async {
    print('INIT');

    _dir = await getApplicationDocumentsDirectory();
    await Hive.initFlutter(_dir.toString());

    //var box = await Hive.openBox('testBox');

    notifyListeners();
  }

  void check() async {
    print(_dir);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
  }
}
