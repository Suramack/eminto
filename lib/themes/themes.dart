import 'package:emito/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Themes {
  Themes._();
  static final ThemeData baseTheme = ThemeData.light();

  static ThemeData buildLightTheme() => ThemeData(
        canvasColor: AppColors.white,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: _buildAppBarTheme(),
        textTheme: _buildLightTextTheme(),
        buttonTheme: _buildButtonTheme(),
        textButtonTheme: _textButtonTheme(),
        unselectedWidgetColor: Colors.white,
        bottomNavigationBarTheme: _bottomNavigationBarThemeData(),
      );

  static AppBarTheme _buildAppBarTheme() {
    return AppBarTheme(
      elevation: 1,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      foregroundColor: AppColors.primaryColor,
      backgroundColor: AppColors.white,
      titleTextStyle: TextStyle(
        color: AppColors.black,
      ),
    );
  }

  static ButtonThemeData _buildButtonTheme() {
    return ButtonThemeData(
      buttonColor: AppColors.primaryColor,
      highlightColor: AppColors.primaryColor,
      hoverColor: AppColors.primaryColor,
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

  static TextButtonThemeData _textButtonTheme() {
    return TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStatePropertyAll(
          AppColors.primaryColor,
        ),
      ),
    );
  }

  static BottomNavigationBarThemeData _bottomNavigationBarThemeData() {
    return BottomNavigationBarThemeData(
      backgroundColor: AppColors.white,
      selectedItemColor: AppColors.primaryGrey,
      unselectedItemColor: AppColors.primaryGrey,
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: true,
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
