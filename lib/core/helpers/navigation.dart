import 'package:flutter/material.dart';

extension NavigationExtension on BuildContext {
  Future<void> push(Widget newScreen) {
    return Navigator.push(
      this,
      MaterialPageRoute(builder: (context) => newScreen),
    );
  }

  Future<void> pushReplacement(Widget newScreen) {
    return Navigator.pushReplacement(
      this,
      MaterialPageRoute(builder: (context) => newScreen),
    );
  }

  Future<void> pushAndRemoveUntil(Widget newScreen) {
    return Navigator.pushAndRemoveUntil(
      this,
      MaterialPageRoute(builder: (context) => newScreen),
      (route) => false,
    );
  }

  void pop() {
    Navigator.pop(this);
  }
}
