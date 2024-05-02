import 'package:flutter/foundation.dart';

class AccountProvider with ChangeNotifier, DiagnosticableTreeMixin {
  bool _switchValue = false;
  

  bool get switchValue => _switchValue;

  void changeSwitchValue(bool value) {
    _switchValue = value;
    notifyListeners();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<bool>('switchValue', switchValue));
  }
}
