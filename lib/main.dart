import 'package:expense_manager/expenses.dart';
import 'package:flutter/material.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 96, 59, 181),
);

var kColorDarkScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 5, 99, 181),
  brightness: Brightness.dark,
);

void main() {
  runApp(
    MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: kColorDarkScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorDarkScheme.primaryContainer,
          foregroundColor: kColorDarkScheme.onPrimaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          color: kColorDarkScheme.primaryContainer,
          margin: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 8,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorDarkScheme.primaryContainer,
          ),
        ),
        //dialogBackgroundColor: kColorDarkScheme.onPrimaryContainer,
      ),
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.primaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          color: kColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 8,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primaryContainer,
          ),
        ),
      ),
      themeMode: ThemeMode.system,
      home: const Expenses(),
    ),
  );
}
