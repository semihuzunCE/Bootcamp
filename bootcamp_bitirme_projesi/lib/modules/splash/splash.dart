import 'package:bootcamp_bitirme_projesi/constants/app_colors.dart';
import 'package:bootcamp_bitirme_projesi/constants/app_constants.dart';
import 'package:bootcamp_bitirme_projesi/constants/asset_constants.dart';
import 'package:bootcamp_bitirme_projesi/modules/home/home_base.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(Duration(seconds: AppConstants.splashTimeout)),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
              body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Container(
                        width: 80.h,
                        height: 80.h,
                        decoration: BoxDecoration(
                            color: AppColors.appOrange,
                            borderRadius: const BorderRadius.only(
                                bottomRight: Radius.circular(24))),
                      ),
                      const SizedBox(height: 8.0),
                      Container(
                        width: 80.h,
                        height: 80.h,
                        decoration: BoxDecoration(
                            color: AppColors.appOrange,
                            borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(24),
                              topRight: Radius.circular(24),
                            )),
                      )
                    ],
                  ),
                  const SizedBox(width: 8.0),
                  Expanded(
                    child: Container(
                      height: 80.h,
                      decoration: BoxDecoration(
                          color: AppColors.appOrange,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(24),
                          )),
                    ),
                  ),
                ],
              ),
              Center(
                child: Image.asset(
                  AssetPaths.splashGif,
                  height: 350.h,
                  width: 350.w,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Container(
                      height: 80.h,
                      decoration: BoxDecoration(
                          color: AppColors.appOrange,
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(24),
                          )),
                    ),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Column(
                    children: [
                      Container(
                        width: 80.h,
                        height: 80.h,
                        decoration: BoxDecoration(
                            color: AppColors.appOrange,
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(24),
                              topLeft: Radius.circular(24),
                            )),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Container(
                        width: 80.h,
                        height: 80.h,
                        decoration: BoxDecoration(
                            color: AppColors.appOrange,
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(24))),
                      ),
                    ],
                  )
                ],
              )
            ],
          ));
        } else {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const HomeBase()),
            );
          });
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
