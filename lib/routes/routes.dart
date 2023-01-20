import 'package:emito/layout/layout.dart';
import 'package:emito/screen/00_splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  Routes._();
  static const splashScreen = '/splash-screen';

  static Map<String, WidgetBuilder> get buildRoutes {
    return {
      splashScreen: (BuildContext context) => const BaseLayout(
            showAppBar: false,
            showBottomNavBar: false,
            screen: SplashScreen(),
          ),
    };
  }

  static Function get unknownRoute {
    return (settings) {
      MaterialPageRoute(builder: (context) => const SplashScreen());
    };
  }

  static String get initialRoute {
    return Routes.initialRoute;
  }
}
