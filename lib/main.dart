// main.dart
import 'package:flutter/material.dart';
import 'cronometro.dart';
import 'corRandom.dart';
import 'meuTheme.dart';
import 'dart:ui';

void main() => runApp(const NavigationBarApp());

class NavigationBarApp extends StatelessWidget {
  const NavigationBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: const NavigationExample(),
    );
  }
}

class NavigationExample extends StatefulWidget {
  const NavigationExample({super.key});

  @override
  State<NavigationExample> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<NavigationExample> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          labelTextStyle: MaterialStateProperty.resolveWith<TextStyle>(
            (Set<MaterialState> states) {
              return TextStyle(
                color: states.contains(MaterialState.selected)
                    ? Colors.white
                    : Colors.grey[700],
                fontSize: 12,
                fontWeight: FontWeight.w500,
              );
            },
          ),
        ),
        child: Container(
          color: Colors.black87.withOpacity(0.9), // Fundo semi-transparente
          child: NavigationBar(
            backgroundColor: Colors.transparent, // Mantém o fundo transparente
            onDestinationSelected: (int index) {
              setState(() {
                currentPageIndex = index;
              });
            },
            indicatorColor: Colors.grey,
            selectedIndex: currentPageIndex,
            destinations: const <Widget>[
              NavigationDestination(
                selectedIcon: Icon(Icons.timer, color: Colors.white),
                icon: Icon(Icons.timer_outlined),
                label: 'Cronômetro',
              ),
              NavigationDestination(
                selectedIcon: Icon(Icons.color_lens, color: Colors.white),
                icon: Icon(Icons.color_lens_outlined),
                label: 'Cor Aleatória',
              ),
            ],
          ),
        ),
      ),
      body: <Widget>[
        const CronometroPage(), // índice 0
        const CorRandomPage(), // índice 1
      ][currentPageIndex],
    );
  }
}
