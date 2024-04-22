import 'package:flutter/foundation.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:word_app/utils/check_server.dart';

late bool initialServerIsRunning;
late PocketBase initialPb;

class PocketbaseProvider with ChangeNotifier, DiagnosticableTreeMixin {
  bool _serverIsRunning = initialServerIsRunning;
  final PocketBase? _pb = (initialServerIsRunning == true ? initialPb : null);

  bool get serverIsRunning => _serverIsRunning;
  PocketBase? get pb => _pb;

  void changeServerStatus(bool value) {
    _serverIsRunning = value;
    notifyListeners();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<bool>('serverIsRunning', serverIsRunning));
    properties.add(DiagnosticsProperty<PocketBase>('pb', pb));
  }
}
