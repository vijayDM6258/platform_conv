import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';

class MainProvider extends ChangeNotifier {
  int menuIndex = 0;
  int? itemSelect;
  String? item2Select;
  double slideVal = 0;

  PageController pageController = PageController();

  void changeMenuIndex(int index) {
    menuIndex = index;
    notifyListeners();
  }

  void changeSlideVal(double val) {
    slideVal = val;
    notifyListeners();
  }

  void changeItem1(int item) {
    itemSelect = item;
    notifyListeners();
  }

  void changeItem2(String item) {
    item2Select = item;
    notifyListeners();
  }
}
