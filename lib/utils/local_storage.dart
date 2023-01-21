import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  LocalStorage._();
  static Future<void> setNotification(String notification) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('notification', notification);
  }

  static Future<void> clearNotification() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('notification');
  }

  static Future<String> getNotification() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('notification') ?? '';
  }
}
