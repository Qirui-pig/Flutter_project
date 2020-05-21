

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class PlayProvider with ChangeNotifier,DiagnosticableTreeMixin{
  bool _isPlay = false;
  bool get isPlay => _isPlay;

  set isPlay(bool value) {
    _isPlay = value;
    notifyListeners();
  }
}