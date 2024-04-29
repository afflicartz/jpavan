import 'package:flutter/material.dart';

class UserState extends ChangeNotifier {
  late String _userId;
  late String _UniqueKey;

  String get userId => _userId;
  String get UniqueKey => _UniqueKey;

  void setUserId(String userId) {
    _userId = userId;
    notifyListeners(); // Notify listeners of the change
  }

  void setUniqueKey(String UniqueKey) {
    _UniqueKey = UniqueKey;
    notifyListeners(); // Notify listeners of the change
  }
}
