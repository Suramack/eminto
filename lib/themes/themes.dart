import 'package:emito/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Themes {
  Themes._();
  static final ThemeData baseTheme = ThemeData.light();

  static ThemeData buildLightTheme() => ThemeData(
        canvasColor: AppColors.primaryColor,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: _buildAppBarTheme(),
        textTheme: _buildLightTextTheme(),
        buttonTheme: _buildButtonTheme(),
        unselectedWidgetColor: Colors.white,
        bottomNavigationBarTheme: _bottomNavigationBarThemeData(),
      );

  static AppBarTheme _buildAppBarTheme() {
    return AppBarTheme(
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      color: AppColors.primaryColor,
      foregroundColor: AppColors.primaryColor,
    );
  }

  static ButtonThemeData _buildButtonTheme() {
    return ButtonThemeData(
      buttonColor: AppColors.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      height: 60,
      colorScheme: baseTheme.colorScheme.copyWith(
        primary: AppColors.white,
        secondary: AppColors.primaryColor,
      ),
    );
  }

  static BottomNavigationBarThemeData _bottomNavigationBarThemeData() {
    return BottomNavigationBarThemeData(
      selectedIconTheme: IconThemeData(
        color: AppColors.primaryColor,
      ),
    );
  }

  static TextTheme _buildLightTextTheme() => baseTheme.textTheme
      .copyWith(
        titleMedium: baseTheme.textTheme.titleMedium!.copyWith(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: AppColors.black,
        ),
      )
      .apply(fontFamily: 'poppins');
}
