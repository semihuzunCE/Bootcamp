import 'package:bootcamp_bitirme_projesi/constants/app_colors.dart';
import 'package:bootcamp_bitirme_projesi/modules/cart/cart_bloc/cart_bloc.dart';
import 'package:bootcamp_bitirme_projesi/modules/home/home.dart';
import 'package:bootcamp_bitirme_projesi/modules/home/home_base.dart';
import 'package:bootcamp_bitirme_projesi/modules/splash/splash.dart';
import 'package:bootcamp_bitirme_projesi/repository/yemek_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'modules/home/home_bloc/home_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
   
   
    ScreenUtil.init(context, designSize: const Size(412, 732));
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeBloc()..add(GetAllYemek()),
        ),
        BlocProvider(
          create: (context) => CartBloc()..add(GetAllSepetYemek()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.appOrange),
          useMaterial3: false,
        ),
        home: const Splash(),
      ),
    );
  }
}
