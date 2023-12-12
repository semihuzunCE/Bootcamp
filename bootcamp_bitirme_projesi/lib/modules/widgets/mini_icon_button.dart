import 'package:bootcamp_bitirme_projesi/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MiniIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const MiniIconButton({super.key, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.appOrange,
            borderRadius: const BorderRadius.all(Radius.circular(4.0))),
        height: 20.h,
        width: 20.h,
        child: Center(
            child: Icon(
          icon,
          size: 16.h,
          color: Colors.white,
        )),
      ),
    );
  }
}
