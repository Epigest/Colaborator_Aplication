import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract final class AppTheme {
  // The FlexColorScheme defined light mode ThemeData.
  static ThemeData light = FlexThemeData.light(
    // User defined custom colors made with FlexSchemeColor() API.
    colors: const FlexSchemeColor(
      primary: Color(0xFFFF6D00),
      primaryContainer: Color(0xFFFFD180),
      secondary: Color(0xFFFFD600),
      secondaryContainer: Color(0xFFFFFF8D),
      tertiary: Color(0xFF2962FF),
      tertiaryContainer: Color(0xFF82B1FF),
      appBarColor: Color(0xFFFFFF8D),
      error: Color(0xFFBA1A1A),
      errorContainer: Color(0xFFFFDAD6),
    ),
    // Input color modifiers.
    useMaterial3ErrorColors: true,
    // Component theme configurations for light mode.
    subThemesData: const FlexSubThemesData(
      useMaterial3Typography: true,
      defaultRadius: 10.0,
      inputDecoratorIsFilled: true,
      inputDecoratorBorderSchemeColor: SchemeColor.primary,
      inputDecoratorBorderType: FlexInputBorderType.outline,
      chipSchemeColor: SchemeColor.onTertiary,
      chipSelectedSchemeColor: SchemeColor.tertiaryContainer,
      chipSecondarySelectedSchemeColor: SchemeColor.tertiaryContainer,
      chipDeleteIconSchemeColor: SchemeColor.error,
      chipBlendColors: true,
      alignedDropdown: true,
      tooltipRadius: 4,
      tooltipSchemeColor: SchemeColor.inverseSurface,
      tooltipOpacity: 0.9,
      snackBarBackgroundSchemeColor: SchemeColor.onSurfaceVariant,
      snackBarActionSchemeColor: SchemeColor.surface,
      appBarCenterTitle: true,
      tabBarUnselectedItemOpacity: 0.65,
      tabBarTabAlignment: TabAlignment.start,
      drawerIndicatorSchemeColor: SchemeColor.tertiaryContainer,
      drawerIndicatorOpacity: 0.5,
      bottomNavigationBarSelectedLabelSchemeColor: SchemeColor.tertiaryContainer,
      bottomNavigationBarMutedUnselectedLabel: true,
      bottomNavigationBarSelectedIconSchemeColor: SchemeColor.tertiaryContainer,
      bottomNavigationBarMutedUnselectedIcon: true,
      navigationBarIndicatorSchemeColor: SchemeColor.tertiaryContainer,
      navigationBarIndicatorOpacity: 0.50,
      navigationBarLabelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
      navigationRailMutedUnselectedLabel: true,
      navigationRailMutedUnselectedIcon: true,
      navigationRailUseIndicator: true,
      navigationRailIndicatorSchemeColor: SchemeColor.tertiaryContainer,
      navigationRailIndicatorOpacity: 0.50,
      navigationRailLabelType: NavigationRailLabelType.selected,
    ),
    // Direct ThemeData properties.
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    cupertinoOverrideTheme: const CupertinoThemeData(applyThemeToAll: true),
  );

  // The FlexColorScheme defined dark mode ThemeData.
  static ThemeData dark = FlexThemeData.dark(
    // User defined custom colors made with FlexSchemeColor() API.
    colors: const FlexSchemeColor(
      primary: Color(0xFFFFD180),
      primaryContainer: Color(0xFFFF6D00),
      primaryLightRef: Color(0xFFFF6D00), // The color of light mode primary
      secondary: Color(0xFFFFFF8D),
      secondaryContainer: Color(0xFFFFD600),
      secondaryLightRef: Color(0xFFFFD600), // The color of light mode secondary
      tertiary: Color(0xFF82B1FF),
      tertiaryContainer: Color(0xFF2962FF),
      tertiaryLightRef: Color(0xFF2962FF), // The color of light mode tertiary
      appBarColor: Color(0xFFFFFF8D),
      error: Color(0xFFFFB4AB),
      errorContainer: Color(0xFF93000A),
    ),
    // Input color modifiers.
    useMaterial3ErrorColors: true,
    // Component theme configurations for dark mode.
    subThemesData: const FlexSubThemesData(
      blendOnColors: true,
      useMaterial3Typography: true,
      defaultRadius: 10.0,
      inputDecoratorIsFilled: true,
      inputDecoratorBorderSchemeColor: SchemeColor.primaryContainer,
      inputDecoratorBorderType: FlexInputBorderType.outline,
      chipSchemeColor: SchemeColor.onTertiary,
      chipSelectedSchemeColor: SchemeColor.tertiaryContainer,
      chipSecondarySelectedSchemeColor: SchemeColor.tertiaryContainer,
      chipDeleteIconSchemeColor: SchemeColor.error,
      chipBlendColors: true,
      alignedDropdown: true,
      tooltipRadius: 4,
      tooltipSchemeColor: SchemeColor.inverseSurface,
      tooltipOpacity: 0.9,
      snackBarBackgroundSchemeColor: SchemeColor.onSurfaceVariant,
      snackBarActionSchemeColor: SchemeColor.surface,
      appBarCenterTitle: true,
      tabBarItemSchemeColor: SchemeColor.primaryContainer,
      tabBarIndicatorSchemeColor: SchemeColor.primaryContainer,
      tabBarTabAlignment: TabAlignment.start,
      drawerIndicatorSchemeColor: SchemeColor.tertiaryContainer,
      drawerIndicatorOpacity: 0.5,
      bottomNavigationBarSelectedLabelSchemeColor: SchemeColor.tertiaryContainer,
      bottomNavigationBarMutedUnselectedLabel: true,
      bottomNavigationBarSelectedIconSchemeColor: SchemeColor.tertiaryContainer,
      bottomNavigationBarMutedUnselectedIcon: true,
      navigationBarIndicatorSchemeColor: SchemeColor.tertiaryContainer,
      navigationBarIndicatorOpacity: 0.50,
      navigationBarLabelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
      navigationRailMutedUnselectedLabel: true,
      navigationRailMutedUnselectedIcon: true,
      navigationRailUseIndicator: true,
      navigationRailIndicatorSchemeColor: SchemeColor.tertiaryContainer,
      navigationRailIndicatorOpacity: 0.50,
      navigationRailLabelType: NavigationRailLabelType.selected,
    ),
    // Direct ThemeData properties.
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    cupertinoOverrideTheme: const CupertinoThemeData(applyThemeToAll: true),
  );
}
