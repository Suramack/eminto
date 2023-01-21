import 'package:emito/resources/strings.dart';
import 'package:emito/themes/colors.dart';
import 'package:flutter/material.dart';

class DummyScreen extends StatelessWidget {
  const DummyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context) == null
        ? {}
        : ModalRoute.of(context)!.settings.arguments == null
            ? {}
            : ModalRoute.of(context)!.settings.arguments as Map;
    return Center(
      child: Text(
        args['title'] ?? Strings.dummyScreen,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: AppColors.black,
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }
}
