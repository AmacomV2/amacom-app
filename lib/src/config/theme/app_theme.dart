import 'package:flutter/material.dart';
import 'package:amacom_app/src/config/theme/figma_colors.dart';

import 'package:amacom_app/src/utils/utils/utils.dart';

/// App theme.
///
/// Class used to manage theme data on app.
ThemeData globalTheme() {
  TextTheme globalTextTheme(TextTheme textTheme) {
    return textTheme.copyWith(
      headlineLarge: textTheme.headlineLarge?.copyWith(
        fontFamily: 'GoldplayAlt',
        fontWeight: FontWeight.w700,
        fontSize: 40,
        color: const Color(0xff323231),
      ),
      headlineMedium: textTheme.headlineMedium?.copyWith(
        fontFamily: 'GoldplayAlt',
        fontWeight: FontWeight.w700,
        fontSize: 32,
        color: const Color(0xff323231),
      ),
      headlineSmall: textTheme.headlineSmall?.copyWith(
        fontFamily: 'GoldplayAlt',
        fontWeight: FontWeight.w700,
        fontSize: 24.0,
        color: const Color(0xff323231),
      ),
      displayLarge: textTheme.displayLarge?.copyWith(
        fontFamily: 'Goldplay',
        fontWeight: FontWeight.w700,
        fontSize: 55.0,
        color: const Color(0xff323231),
      ),
      displayMedium: textTheme.displayMedium?.copyWith(
        fontFamily: 'Goldplay',
        fontWeight: FontWeight.w600,
        fontSize: 16,
        color: const Color(0xff323231),
      ),
      displaySmall: textTheme.displaySmall?.copyWith(
        fontFamily: 'Goldplay',
        fontWeight: FontWeight.w500,
        fontSize: 10.0,
        color: const Color(0xff323231),
      ),
      titleLarge: textTheme.titleLarge?.copyWith(
        fontFamily: 'Goldplay',
        fontWeight: FontWeight.w700,
        fontSize: 55.0,
        color: const Color(0xff323231),
      ),
      titleMedium: textTheme.titleMedium?.copyWith(
        fontFamily: 'Goldplay',
        fontWeight: FontWeight.w600,
        fontSize: 16,
        color: const Color(0xff323231),
      ),
      titleSmall: textTheme.titleSmall?.copyWith(
        fontFamily: 'Goldplay',
        fontWeight: FontWeight.w500,
        fontSize: 14.0,
        color: const Color(0xff323231),
      ),
      labelLarge: textTheme.labelLarge?.copyWith(
        fontFamily: 'Goldplay',
        fontWeight: FontWeight.w600,
        fontSize: 16.0,
        color: const Color(0xff323231),
      ),
      labelMedium: textTheme.labelMedium?.copyWith(
        fontFamily: 'Goldplay',
        fontWeight: FontWeight.w600,
        fontSize: 16.0,
        color: const Color(0xff323231),
      ),
      labelSmall: textTheme.labelSmall?.copyWith(
        fontFamily: 'Goldplay',
        fontWeight: FontWeight.w600,
        fontSize: 16.0,
        color: const Color(0xff323231),
      ),
      bodyLarge: textTheme.bodyLarge?.copyWith(
        fontFamily: 'Goldplay',
        fontWeight: FontWeight.w500,
        fontSize: 16.0,
        color: const Color(0xff323231),
      ),
      bodyMedium: textTheme.bodyMedium?.copyWith(
        fontFamily: 'Goldplay',
        fontWeight: FontWeight.w400,
        fontSize: 14.0,
        color: const Color(0xff323231),
      ),
      bodySmall: textTheme.bodySmall?.copyWith(
        fontFamily: 'Goldplay',
        fontWeight: FontWeight.w400,
        fontSize: 10.0,
        color: const Color(0xff323231),
      ),
    );
  }

  /// Take defined colors from design.
  ColorScheme colorSchemeTheme(ColorScheme themeColor) {
    return themeColor.copyWith(
      primary:  FigmaColors.primary_300,
      inversePrimary: FigmaColors.primary_300,
      primaryContainer: FigmaColors.primary_200,
      outline:  FigmaColors.primary_300,
      secondary: const Color(0xff323231),
      onSecondary: const Color(0xffFBFBFB),
      onPrimary: const Color(0xffEBF1FF),
      tertiary: const Color(0xff323231),
      onTertiaryContainer: const Color(0xffD9DBD8),
      onPrimaryContainer: FigmaColors.primary_50,
      background:  Colors.white,
      error: FigmaColors.danger_700,
      onError: Colors.white,
    );
  }

  ButtonThemeData buttonThemeData(ButtonThemeData themeButtonTheme) {
    return themeButtonTheme.copyWith(
      buttonColor: FigmaColors.primary_300,
      disabledColor: FigmaColors.secondary_300,
    );
  }

  DropdownMenuThemeData dropDownMenuThemeData(DropdownMenuThemeData ddTheme) {
    return ddTheme.copyWith(
      menuStyle: MenuStyle(
        padding: const MaterialStatePropertyAll<EdgeInsets>(
          EdgeInsets.symmetric(
            horizontal: 20,
          ),
        ),
        backgroundColor:
            const MaterialStatePropertyAll<Color>(FigmaColors.secondary_200),
        shape: MaterialStatePropertyAll<OutlinedBorder>(
          RoundedRectangleBorder(
            side: const BorderSide(
              width: 1,
              color: FigmaColors.primary_300,
            ),
            borderRadius: BorderRadius.circular(
              AppSizes.genericBorderRadius,
            ),
          ),
        ),
        side: const MaterialStatePropertyAll<BorderSide>(
          BorderSide(
            width: 1,
            color: FigmaColors.primary_300,
          ),
        ),
      ),
    );
  }

  SliderThemeData sliderThemeData(SliderThemeData sliderThemeData) {
    return sliderThemeData.copyWith(
      activeTrackColor: const Color.fromRGBO(255, 255, 255, 1),
      thumbColor: const Color.fromRGBO(72, 104, 126, 1),
      inactiveTrackColor: const Color.fromRGBO(72, 104, 126, 1),
    );
  }

  InputDecorationTheme inputDecorationTheme(InputDecorationTheme theme) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: const BorderSide(
        color: FigmaColors.primary_300,
        width: 0.5,
      ),
    );
    final focusedBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: const BorderSide(
        color: FigmaColors.primary_300,
        width: 1,
      ),
    );
    final errorBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: const BorderSide(
        color: Color(0xffaa3030),
        width: 1,
      ),
    );
    const outlineBorder = BorderSide.none;
    return theme.copyWith(
      border: border,
      focusedBorder: focusedBorder,
      enabledBorder: border,
      errorBorder: errorBorder,
      outlineBorder: outlineBorder,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
      labelStyle: theme.labelStyle?.copyWith(
        fontFamily: 'Goldplay',
        fontWeight: FontWeight.w500,
        fontSize: 16.0,
        color: const Color(0xff323231),
      ),
      floatingLabelStyle: theme.labelStyle?.copyWith(
        fontFamily: 'Goldplay',
        fontWeight: FontWeight.w500,
        fontSize: 16.0,
        color: const Color(0xff323231),
      ),
      errorStyle: theme.labelStyle?.copyWith(
        fontFamily: 'Goldplay',
        fontWeight: FontWeight.w500,
        fontSize: 16.0,
        color:  FigmaColors.danger_400,
      ),
      hintStyle: theme.labelStyle?.copyWith(
        fontFamily: 'Goldplay',
        fontWeight: FontWeight.w500,
        fontSize: 16.0,
        color: const Color(0xff323231),
      ),
    );
  }

  CheckboxThemeData checkboxThemeData(CheckboxThemeData checkboxThemeData) {
    return checkboxThemeData.copyWith(
      fillColor: MaterialStateProperty.all<Color>(
        const Color(0xff176AFC),
      ),
    );
  }

  BottomNavigationBarThemeData bottomBarThemeData(
    BottomNavigationBarThemeData bottomNavBarThemeData,
  ) {
    return bottomNavBarThemeData.copyWith(
      backgroundColor: Colors.white,
      selectedItemColor: const Color(0xff323231),
      unselectedItemColor: const Color(0xffE0DFE0),
      selectedLabelStyle: bottomNavBarThemeData.selectedLabelStyle?.copyWith(
        fontFamily: 'Goldplay',
        fontWeight: FontWeight.w500,
        fontSize: 14.0,
        color: const Color(0xff323231),
      ),
      selectedIconTheme: bottomNavBarThemeData.selectedIconTheme?.copyWith(
        color: const Color(0xff323231),
      ),
      unselectedIconTheme: bottomNavBarThemeData.unselectedIconTheme?.copyWith(
        color: const Color(0xffE0DFE0),
      ),
    );
  }

  ListTileThemeData listTileThemeData(
    ListTileThemeData listTileThemeData,
  ) {
    return listTileThemeData.copyWith(iconColor:  FigmaColors.primary_300);
  }

  final ThemeData theme = ThemeData.light();

  return theme.copyWith(
    primaryColor: const Color(0xff1C418C),
    shadowColor: Colors.grey,
    colorScheme: colorSchemeTheme(theme.colorScheme),
    sliderTheme: sliderThemeData(theme.sliderTheme),
    scaffoldBackgroundColor: FigmaColors.background,
    textTheme: globalTextTheme(theme.textTheme),
    dropdownMenuTheme: dropDownMenuThemeData(theme.dropdownMenuTheme),
    buttonTheme: buttonThemeData(theme.buttonTheme),
    checkboxTheme: checkboxThemeData(theme.checkboxTheme),
    inputDecorationTheme: inputDecorationTheme(theme.inputDecorationTheme),
    appBarTheme: const AppBarTheme(
      centerTitle: false,
      color: Colors.transparent,
      iconTheme: IconThemeData(
        color: Color.fromRGBO(255, 255, 255, 1),
        size: 24.0,
      ),
    ),
    bottomNavigationBarTheme: bottomBarThemeData(
      theme.bottomNavigationBarTheme,
    ),
    listTileTheme: listTileThemeData(theme.listTileTheme),
  );
}
