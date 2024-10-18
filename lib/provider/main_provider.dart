import 'dart:io';

import 'package:flutter/material.dart';

class MainProvider extends ChangeNotifier {
  int menuIndex = 0;

  PageController pageController = PageController();

  void changeMenuIndex(int index) {
    menuIndex = index;
    notifyListeners();
  }
}
