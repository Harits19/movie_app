import 'package:flutter/material.dart';

class NavigatorHelper {
  static push(BuildContext context, Widget route) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => route));
  }
}
