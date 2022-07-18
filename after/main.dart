import 'dart:async';

import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:calculator/theme_manager.dart';
import 'package:calculator/buttons.dart';
import 'package:calculator/settings.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  final themeNotifier = ThemeNotifier();
  await themeNotifier.init();
  return runApp(ChangeNotifierProvider<ThemeNotifier>.value(
    value: themeNotifier,
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, theme, child) => MaterialApp(
        theme: theme.getTheme(),
        debugShowCheckedModeBanner: false,
        home: CalculatorPage(),
      )
    );
  }
}

class CalculatorPage extends StatefulWidget {
  CalculatorPage({Key? key}) : super(key: key);

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}



// Code here
