import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:odev5/constants/app_colors.dart';
import 'package:odev5/ui/anasayfa.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        hintColor: AppColors.symbolWhite,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          background: AppColors.appBlack,
          primary: Colors.white,
        ),
        useMaterial3: true,
      ),
      home: const AnaSayfa(),
    );
  }
}
