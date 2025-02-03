import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: Colors.grey[300], // Cor de fundo padrão
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.black87, // Cor da AppBar
    foregroundColor: Colors.white, // Cor do texto na AppBar
  ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(fontSize: 20, color: Colors.black),
    bodyMedium: TextStyle(fontSize: 18, color: Colors.black87),
    titleLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.black87, // Cor do botão
      foregroundColor: Colors.grey[300], // Cor do texto
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: Colors.black87, // Cor do texto
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  ),
);
