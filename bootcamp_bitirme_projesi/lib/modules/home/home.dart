import 'package:bootcamp_bitirme_projesi/constants/app_colors.dart';
import 'package:bootcamp_bitirme_projesi/modules/detail/detail.dart';
import 'package:bootcamp_bitirme_projesi/modules/home/home_bloc/home_bloc.dart';
import 'package:bootcamp_bitirme_projesi/modules/widgets/food_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late TextEditingController searchController;
  bool aramaYapiliyorMu = false;
  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40.h,
              child: SearchBar(
                onChanged: (value) {
                  setState(() {
                    if (value.isNotEmpty) {
                      aramaYapiliyorMu = true;
                      context.read<HomeBloc>().add(Ara(arananKelime: value));
                    } else {
                      aramaYapiliyorMu = false;
                    }
                  });
                },
                controller: searchController,
                elevation: const MaterialStatePropertyAll(1.0),
                shape: const MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)))),
                hintText: "Search",
                leading: Icon(
                  Icons.search,
                  color: AppColors.appOrange,
                ),
                backgroundColor: const MaterialStatePropertyAll(Colors.white),
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Text(
              "Popular Foods",
              style: TextStyle(fontSize: 16.h, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 16.h,
            ),
            Expanded(
              child: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // İki sütunlu grid
                      crossAxisSpacing: 12.0, // Sütunlar arası boşluk
                      mainAxisSpacing: 8.0, // Satırlar arası boşluk
                    ),
                    itemCount: aramaYapiliyorMu
                        ? state.arananYemekler.length
                        : state.yemekler.length,
                    itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) {
                              return Detail(
                                yemek: aramaYapiliyorMu
                                    ? state.arananYemekler[index]
                                    : state.yemekler[index],
                              );
                            },
                          ));
                        },
                        child: FoodCard(
                          yemek: aramaYapiliyorMu
                              ? state.arananYemekler[index]
                              : state.yemekler[index],
                        )),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
