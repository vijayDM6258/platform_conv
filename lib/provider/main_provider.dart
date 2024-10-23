import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:platform_conv/model/student.dart';
import 'package:platform_conv/util/global.dart';

class MainProvider extends ChangeNotifier {
  int menuIndex = 0;
  int? itemSelect;
  String? item2Select;
  double slideVal = 0;

  List<Student> mainStudentList = sList;
  List<Student> searchStudentList = sList;

  PageController pageController = PageController();

  void changeMenuIndex(int index) {
    menuIndex = index;
    notifyListeners();
  }

  void searchStudent(int marks) {
    searchStudentList = mainStudentList.where((element) {
      return (element.marks ?? 0) > marks;
    }).toList();
    notifyListeners();
  }

  void searchStudentByName(String name) {
    searchStudentList = mainStudentList.where((element) {
      return element.name?.toLowerCase().contains(name.toLowerCase()) ?? false;
    }).toList();
    notifyListeners();
  }

  void changeSlideVal(double val) {
    slideVal = val;
    searchStudent(val.toInt());
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
