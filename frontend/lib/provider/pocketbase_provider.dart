import 'package:flutter/foundation.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:word_app/utils/logger.dart';

late bool initialServerIsRunning;
late PocketBase pocketbase;

Future<void> signUp(username, email, password, passwordConfirm, name) async {
  final body = {
    "username": username,
    "email": email,
    "password": password,
    "passwordConfirm": passwordConfirm,
    "name": name,
  };

  final record = await pocketbase.collection('users').create(body: body);
  logger.d(record);
}

class PocketbaseProvider with ChangeNotifier, DiagnosticableTreeMixin {
  bool _serverIsRunning = initialServerIsRunning;

  bool get serverIsRunning => _serverIsRunning;

  void changeServerStatus(bool value) {
    _serverIsRunning = value;
    notifyListeners();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty<bool>('serverIsRunning', serverIsRunning));
  }
}
