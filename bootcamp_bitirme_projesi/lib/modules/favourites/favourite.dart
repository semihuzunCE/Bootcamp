import 'package:bootcamp_bitirme_projesi/modules/detail/detail.dart';
import 'package:bootcamp_bitirme_projesi/modules/home/home_bloc/home_bloc.dart';
import 'package:bootcamp_bitirme_projesi/modules/widgets/food_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Favourites extends StatelessWidget {
  const Favourites({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Favourite Foods:",
                style: TextStyle(fontSize: 16.h, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // İki sütunlu grid
                    crossAxisSpacing: 12.0, // Sütunlar arası boşluk
                    mainAxisSpacing: 8.0, // Satırlar arası boşluk
                  ),
                  itemCount: state.favoriYemekler.length,
                  itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            return Detail(
                              yemek: state.favoriYemekler[index],
                            );
                          },
                        ));
                      },
                      child: FoodCard(
                        yemek: state.favoriYemekler[index],
                      )),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
