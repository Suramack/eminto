import 'package:flutter/material.dart';

class Navigation {
  Navigation._();
  static Future<dynamic> pushNamed(BuildContext context, String routeName,
      [Object? arguments]) {
    return Navigator.of(context).pushNamed(routeName, arguments: arguments);
  }

  static Future<dynamic> pushReplacementNamed(
      BuildContext context, String routeName,
      [Object? arguments]) {
    return Navigator.of(context)
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  static Future<dynamic> pushNamedAndRemoveUntil(
      BuildContext context, String routeName,
      [Object? arguments]) {
    return Navigator.of(context).pushNamedAndRemoveUntil(
      routeName,
      (Route<dynamic> route) => false,
    );
  }

  static dynamic pop(BuildContext context) {
    Navigator.pop(context);
  }

  static Future<dynamic> popAndPushNamed(BuildContext context, String routeName,
      [Object? arguments]) {
    return Navigator.of(context).popAndPushNamed(
      routeName,
      arguments: arguments,
    );
  }
}
