import 'package:emito/routes/routes.dart';
import 'package:emito/themes/themes.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'emito',
      theme: Themes.buildLightTheme(),
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.initialRoute,
      routes: Routes.buildRoutes,
      onUnknownRoute:
          Routes.unknownRoute as Route<dynamic>? Function(RouteSettings),
    );
  }
}
