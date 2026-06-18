import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zomato/core/theme/app_theme.dart';
import 'package:zomato/features/home/presentation/pages/home_page.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: HomePage(),
    );
  }
}