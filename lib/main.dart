import 'package:flutter/material.dart';
import 'package:food_ui_design/components.dart';
import 'package:food_ui_design/layout.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Food UI",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: Color(0xFFE85852),
      ),
      routes: {
        'details': (context) => createDetails(context),
      },
      home: AppScreen(),
    );
  }
}