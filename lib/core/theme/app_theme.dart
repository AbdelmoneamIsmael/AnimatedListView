import 'package:abdelmoneam_create_an_animation_scroll/core/utiles/colors.dart';
import 'package:abdelmoneam_create_an_animation_scroll/core/utiles/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract class AppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.backgroundColor,
    textTheme: TextTheme(
      headlineMedium: AppTextStyle.mediumrOxTitle.copyWith(
        fontSize: 18,
        color: AppColors.titleTextColor,
      ),
      titleMedium: AppTextStyle.semiBoldrOxTitle
          .copyWith(fontSize: 18, color: AppColors.titleTextColor),
      labelMedium: AppTextStyle.mediumIbmBody
          .copyWith(color: AppColors.normalTextColor, fontSize: 14),
    ),
    iconTheme: IconThemeData(
      color: AppColors.iconActiveColors,
    ),
    colorScheme: const ColorScheme.light().copyWith(
      primary: AppColors.iconActiveColors,
      secondary: AppColors.iconInActiveColors,
      primaryContainer: AppColors.informationContainer,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.backgroundColor,
      foregroundColor: AppColors.forgroundColor,
      centerTitle: true,
      actionsIconTheme: IconThemeData(
        color: AppColors.iconActiveColors,
      ),
      titleTextStyle: AppTextStyle.mediumrOxTitle.copyWith(
        fontSize: 18,
        color: AppColors.titleTextColor,
      ),
      scrolledUnderElevation: 0,
      elevation: 0,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.backgroundColor,
      selectedItemColor: AppColors.iconActiveColors,
      unselectedItemColor: AppColors.iconInActiveColors,
    ),
  );
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.backgroundColor,
    textTheme: TextTheme(
      headlineMedium: AppTextStyle.mediumrOxTitle.copyWith(
        fontSize: 18,
        color: AppColors.titleTextColor,
      ),
      titleMedium: AppTextStyle.semiBoldrOxTitle
          .copyWith(fontSize: 18, color: AppColors.titleTextColor),
      labelMedium: AppTextStyle.mediumIbmBody
          .copyWith(color: AppColors.normalTextColor, fontSize: 14),
    ),
    colorScheme: const ColorScheme.light().copyWith(
      primary: AppColors.iconActiveColors,
      secondary: AppColors.iconInActiveColors,
      primaryContainer: AppColors.informationContainer,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.backgroundColor,
      foregroundColor: AppColors.forgroundColor,
      centerTitle: true,
      actionsIconTheme: IconThemeData(
        color: AppColors.iconActiveColors,
      ),
      scrolledUnderElevation: 0,
      elevation: 0,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.backgroundColor,
      selectedItemColor: AppColors.iconActiveColors,
      unselectedItemColor: AppColors.iconInActiveColors,
    ),
  );
}
