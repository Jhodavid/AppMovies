import 'package:flutter/material.dart';

class UiProvider extends ChangeNotifier {

  int _screenCurrentIndex = 0;

  int get screenCurrentIndex {
    return _screenCurrentIndex;
  }

  set screenCurrentIndex( int i ) {
    _screenCurrentIndex = i;
    notifyListeners();
  }
}