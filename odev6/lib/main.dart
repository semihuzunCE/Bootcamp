import 'package:flutter/material.dart';
import 'package:odev6/anasayfa.dart';
import 'package:odev6/constants/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple,background: AppColors.appBlue),
        useMaterial3: true,
      ),
      home: const AnaSayfa(),
    );
  }
}

