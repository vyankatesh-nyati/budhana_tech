import 'package:budhana_tech_task/config/colors.dart';
import 'package:budhana_tech_task/screens/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Budhana Tech',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: yellow),
        fontFamily: 'Inter',
        appBarTheme: const AppBarTheme(
          // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          backgroundColor: yellow,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontFamily: 'Alumni Sans',
            color: black,
            fontWeight: FontWeight.w800,
            fontSize: 30,
          ),
        ),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
