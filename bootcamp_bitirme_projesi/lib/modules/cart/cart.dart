import 'package:bootcamp_bitirme_projesi/constants/app_colors.dart';
import 'package:bootcamp_bitirme_projesi/constants/asset_constants.dart';
import 'package:bootcamp_bitirme_projesi/modules/cart/cart_bloc/cart_bloc.dart';
import 'package:bootcamp_bitirme_projesi/modules/widgets/alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/mini_icon_button.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return Scaffold(
          body: Column(
            children: [
              SizedBox(
                height: 350.h,
                child: ListView.builder(
                  padding: const EdgeInsets.all(8.0),
                  itemExtent: 110.h,
                  itemCount: state.sepetYemekler.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                        width: double.infinity,
                        child: Card(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Row(
                              children: [
                                Image.network(
                                  '${AssetPaths.imagesUrl}${state.sepetYemekler[index].yemek_resim_adi}',
                                  fit: BoxFit.fitHeight,
                                  loadingBuilder:
                                      (context, child, loadingProgress) {
                                    if (loadingProgress == null) {
                                      return child;
                                    } else {
                                      return Center(
                                        child: SizedBox(
                                            height: 40.h,
                                            width: 40.h,
                                            child:
                                                const CircularProgressIndicator()),
                                      );
                                    }
                                  },
                                ),
                                const SizedBox(
                                  width: 8.0,
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(state.sepetYemekler[index].yemek_adi),
                                    Text(
                                      "₺${state.sepetYemekler[index].yemek_fiyat}",
                                      style:
                                          TextStyle(color: AppColors.appOrange),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        MiniIconButton(
                                          icon: Icons.remove,
                                          onTap: () {
                                            context.read<CartBloc>().add(
                                                ChangeSepetYemekAdet(
                                                    index: index,
                                                    artir: false));
                                          },
                                        ),
                                        const SizedBox(width: 8.0),
                                        Text(state.sepetYemekler[index]
                                            .yemek_siparis_adet),
                                        const SizedBox(width: 8.0),
                                        MiniIconButton(
                                          icon: Icons.add,
                                          onTap: () {
                                            context.read<CartBloc>().add(
                                                ChangeSepetYemekAdet(
                                                    index: index, artir: true));
                                          },
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        context.read<CartBloc>().add(
                                            DeleteSepetYemek(
                                                sepet_yemek_id: state
                                                    .sepetYemekler[index]
                                                    .sepet_yemek_id));
                                      },
                                      child: const Icon(Icons.close),
                                    ),
                                    const Text(""),
                                    Text(
                                      "₺${state.sepetYemeklerTotalFiyat[index].toString()}",
                                      style:
                                          TextStyle(color: AppColors.appOrange),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ));
                  },
                ),
              ),
              priceRow(text: "Subtotal:", cost: "${state.toplamFiyat}.00"),
              priceRow(
                  text: "Shipping:",
                  cost: state.toplamFiyat != 0 ? "34.99" : "0.00"),
              priceRow(
                  text: "Total:",
                  cost: state.toplamFiyat != 0
                      ? "${state.toplamFiyat + 34}.99"
                      : "0.00"),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  onPressed: () {
                    int yemekAdet = state.sepetYemekler.length;
                    if (yemekAdet > 0) {
                      alertShow(context);
                    }
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: AppColors.appOrange,
                    minimumSize: const Size.fromHeight(40),
                  ),
                  child: const Text(
                    "Pay Now",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Widget priceRow({required String text, required String cost}) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            "₺$cost",
            style: const TextStyle(
                color: Colors.grey, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}

/* return Card(
                  color: Colors.black12,
                  child: ListTile(
                   
                    isThreeLine: true,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    leading: SizedBox(
                      width: 80.h,
                      child: Image.network(
                        '${AssetPaths.imagesUrl}kadayif.png',
                        fit: BoxFit.fitHeight,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          } else {
                            return Center(
                              child: SizedBox(
                                  height: 40.h,
                                  width: 40.h,
                                  child: const CircularProgressIndicator()),
                            );
                          }
                        },
                      ),
                    ),
                    title: const Text("Pizza"),
                    subtitle: Text("₺36.00",style:  TextStyle(color: AppColors.appOrange),),
                    trailing:const  Text("trailing"),
                  ),
                ); */