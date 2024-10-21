import 'dart:io';

import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  bool isAndroid = Platform.isIOS;

  void change() {
    isAndroid = !isAndroid;
    notifyListeners();
  }
}
