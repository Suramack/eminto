import 'package:emito/layout/layout.dart';
import 'package:emito/screen/00_splash_screen/splash_screen.dart';
import 'package:emito/screen/01_home_screen/home_screen.dart';
import 'package:emito/screen/05_notification_screen/notification_screen.dart';
import 'package:emito/screen/99_dummy_screen/dummy_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  Routes._();
  static const splashScreen = '/splash-screen';
  static const homeScreen = '/home-screen';
  static const dummyScreen = '/dummy-screen';
  static const notificationScreen = '/notification-screen';

  static Map<String, WidgetBuilder> get buildRoutes {
    return {
      splashScreen: (BuildContext context) => const BaseLayout(
            showAppBar: false,
            showBottomNavBar: false,
            screen: SplashScreen(),
          ),
      homeScreen: (BuildContext context) => const BaseLayout(
            showAppBar: false,
            showBottomNavBar: true,
            screen: HomeScreen(),
          ),
      dummyScreen: (BuildContext context) => const BaseLayout(
            showAppBar: true,
            showBottomNavBar: false,
            screen: DummyScreen(),
          ),
      notificationScreen: (BuildContext context) => const BaseLayout(
            showAppBar: true,
            showBottomNavBar: false,
            screen: NotificationScreen(),
          ),
    };
  }

  static Function get unknownRoute {
    return (settings) {
      MaterialPageRoute(builder: (context) => const SplashScreen());
    };
  }

  static String get initialRoute {
    return Routes.splashScreen;
  }
}
