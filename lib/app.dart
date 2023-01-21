import 'package:emito/bloc/notification/notification_bloc.dart';
import 'package:emito/core/service/notification/notification_service.dart';
import 'package:emito/routes/routes.dart';
import 'package:emito/themes/colors.dart';
import 'package:emito/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: AppColors.transaparant,
      ),
    );
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => NotificationBloc(
            notificationService: NotificationService(),
          ),
        )
      ],
      child: MaterialApp(
        title: 'eminto',
        theme: Themes.buildLightTheme(),
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.initialRoute,
        routes: Routes.buildRoutes,
        onUnknownRoute:
            Routes.unknownRoute as Route<dynamic>? Function(RouteSettings),
      ),
    );
  }
}
