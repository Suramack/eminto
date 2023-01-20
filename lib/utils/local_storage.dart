import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  LocalStorage._();
  static Future<void> setNotification(String notification) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('notification', notification);
  }
}
