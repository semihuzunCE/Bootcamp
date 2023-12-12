import 'package:bootcamp_bitirme_projesi/constants/app_colors.dart';
import 'package:bootcamp_bitirme_projesi/constants/asset_constants.dart';
import 'package:bootcamp_bitirme_projesi/modules/cart/cart_bloc/cart_bloc.dart';
import 'package:bootcamp_bitirme_projesi/modules/home/home_bloc/home_bloc.dart';
import 'package:bootcamp_bitirme_projesi/modules/widgets/mini_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../models/yemek.dart';

class Detail extends StatefulWidget {
  const Detail({super.key, required this.yemek});
  final Yemek yemek;

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  int count = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const SizedBox(
            height: 16.0,
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
        actions:  [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                return   GestureDetector(
                  onTap: () {
                    context.read<HomeBloc>().add(ChangeLikeState(yemek_id: widget.yemek.yemek_id));
                    
                  },
                  child: Icon(
                    state.yemekler[(int.parse(widget.yemek.yemek_id))-1].isLiked?  Icons.favorite:Icons.favorite_border_rounded,
                    color:widget.yemek.isLiked? Colors.red: Colors.black,
                  ),
                );
              },
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(
                '${AssetPaths.imagesUrl}${widget.yemek.yemek_resim_adi}',
                height: 280.h,
                width: 280.h,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  } else {
                    return Center(
                      child: SizedBox(
                        height: 100.h,
                        width: 100.h,
                        child: const CircularProgressIndicator(),
                      ),
                    );
                  }
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MiniIconButton(
                    icon: Icons.remove,
                    onTap: () {
                      setState(() {
                        if (count != 0) {
                          count--;
                        }
                      });
                    },
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Text(count.toString()),
                  const SizedBox(
                    width: 8.0,
                  ),
                  MiniIconButton(
                    icon: Icons.add,
                    onTap: () {
                      setState(() {
                        count++;
                      });
                    },
                  )
                ],
              ),
              const SizedBox(
                height: 16.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.yemek.yemek_adi,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "₺${widget.yemek.yemek_fiyat}",
                    style: TextStyle(color: AppColors.appOrange),
                  ),
                ],
              ),
              const SizedBox(
                height: 32.0,
              ),
              TextButton(
                onPressed: () {
                  context.read<CartBloc>().add(SetSepetYemek(
                      yemek_adi: widget.yemek.yemek_adi,
                      yemek_resim_adi: widget.yemek.yemek_resim_adi,
                      yemek_fiyat: widget.yemek.yemek_fiyat,
                      yemek_siparis_adet: count.toString()));
                  Navigator.of(context).pop();
                },
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.appOrange,
                  minimumSize: const Size.fromHeight(40),
                ),
                child: const Text(
                  "Add to Basket",
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
