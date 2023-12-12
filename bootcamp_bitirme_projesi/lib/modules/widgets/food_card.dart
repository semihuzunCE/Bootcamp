import 'package:bootcamp_bitirme_projesi/constants/app_colors.dart';
import 'package:bootcamp_bitirme_projesi/constants/asset_constants.dart';
import 'package:bootcamp_bitirme_projesi/models/yemek.dart';
import 'package:bootcamp_bitirme_projesi/modules/cart/cart_bloc/cart_bloc.dart';
import 'package:bootcamp_bitirme_projesi/modules/widgets/mini_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FoodCard extends StatelessWidget {
  const FoodCard({
    super.key,
    required this.yemek,
  });

  final Yemek yemek;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      width: 200.h,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.network(
              '${AssetPaths.imagesUrl}${yemek.yemek_resim_adi}',
              height: 130.h,
              width: 130.h,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                } else {
                  return Center(
                    child: SizedBox(
                        height: 100.h,
                        width: 100.h,
                        child: const CircularProgressIndicator()),
                  );
                }
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        yemek.yemek_adi,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 4.0,
                      ),
                      Text(
                        "₺${yemek.yemek_fiyat}",
                        style: TextStyle(color: AppColors.appOrange),
                      )
                    ],
                  ),
                  MiniIconButton(
                    icon: Icons.add,
                    onTap: () {
                      context.read<CartBloc>().add(SetSepetYemek(
                            yemek_adi: yemek.yemek_adi,
                            yemek_resim_adi: yemek.yemek_resim_adi,
                            yemek_fiyat: yemek.yemek_fiyat,
                            yemek_siparis_adet: "1",
                          ));
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
