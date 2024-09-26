import 'package:daily_planner/screen/welcome_screen.dart';
import 'package:daily_planner/utilities/change_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

var brightColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 96, 59, 181));

var darkColorScheme = ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 5, 99, 125),
    brightness: Brightness.dark);

void main() {
  runApp(ChangeNotifierProvider(
      create: (_) => ThemeUtilities(), child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeMode = Provider.of<ThemeUtilities>(context);
    return MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: darkColorScheme,
        cardTheme: const CardTheme().copyWith(
          color: darkColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: darkColorScheme.primaryContainer,
              foregroundColor: darkColorScheme.onPrimaryContainer),
        ),
      ),
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: brightColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: brightColorScheme.onPrimaryContainer,
            foregroundColor: brightColorScheme.primaryContainer),
        cardTheme: CardTheme().copyWith(
          color: brightColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: brightColorScheme.primaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                fontWeight: FontWeight.bold,
                color: brightColorScheme.onSecondaryContainer,
                fontSize: 16,
              ),
            ),
      ),
      debugShowCheckedModeBanner: false,
      themeMode: themeMode.themeMode,
      home: SafeArea(child: const WelcomeScreen()),
    );
  }
}
