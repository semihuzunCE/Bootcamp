import 'package:flutter/material.dart';
import 'package:odev6/constants/app_colors.dart';

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({super.key});

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  final List<String> popCornImages = <String>[
    "shirley.jpg",
    "snatch.jpg",
    "yalda.jpg",
    "baby_driver.jpg"
  ];

  final List<String> kasimImages = <String>[
    "kasim1.jpg",
    "kasim2.jpg",
    "kasim3.jpg",
    "kasim4.jpg",
  ];
  final List<String> miniSeriesImages = <String>[
    "mini1.jpg",
    "mini2.jpg",
    "mini3.jpg",
    "mini4.jpg",
  ];
  final List<String> miniSeriesBannerImages = <String>[
    "mini_banner_1.jpg",
    "mini_banner_2.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(items: [
        bottomNavigationBarItem(
          text: "Keşfet",
          icon: const Icon(Icons.folder_copy),
        ),
        bottomNavigationBarItem(
          text: "Listem",
          icon: const Icon(Icons.folder_open),
        ),
        bottomNavigationBarItem(
          text: "Arama",
          icon: const Icon(Icons.search),
        ),
        bottomNavigationBarItem(
          text: "Canlı TV",
          icon: const Icon(Icons.tv_rounded),
        ),
        bottomNavigationBarItem(
          text: "Hesabım",
          icon: profileIcon(width: 25, height: 25),
        ),
      ]),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.transparent,
            surfaceTintColor: AppColors.appBlue,
            shadowColor: AppColors.appBlue,
            actions: [
              const Icon(Icons.search),
              const SizedBox(
                width: 8.0,
              ),
              profileIcon(width: 30, height: 30),
              const SizedBox(
                width: 16.0,
              )
            ],
            leading: const Icon(
              Icons.menu_outlined,
              size: 32,
              color: Colors.white,
            ),
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: const Row(
                children: [
                  SizedBox(
                    width: 60,
                  ),
                  Text(
                    'BluTv',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 28),
                  ),
                ],
              ),
              background: Image.asset(
                "assets/corsage.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(
                    top: 16.0, left: 8.0, right: 8.0, bottom: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Popcorn Köşesi",
                      style: TextStyle(color: Colors.white),
                    ),
                    categoryListView(images: popCornImages),
                    const SizedBox(
                      height: 24,
                    ),
                    const Text(
                      "Kasımda Aşk",
                      style: TextStyle(color: Colors.white),
                    ),
                    categoryListView(images: kasimImages),
                    const SizedBox(
                      height: 24,
                    ),
                    const Text(
                      "Mini Mini Diziler",
                      style: TextStyle(color: Colors.white),
                    ),
                    categoryListView(images: miniSeriesImages),
                    categoryListView(
                        images: miniSeriesBannerImages, width: 250),
                  ],
                ),
              );
            }, childCount: 1),
          ),
        ],
      ),
    );
  }

  Container profileIcon({required double width, required double height}) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: const Center(
          child: Text(
        "SU",
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      )),
    );
  }

  BottomNavigationBarItem bottomNavigationBarItem(
      {required String text, required Widget icon}) {
    return BottomNavigationBarItem(
        label: "",
        icon: Column(
          children: [
            icon,
            Text(
              text,
              style: const TextStyle(color: Colors.white),
            )
          ],
        ));
  }

  Container categoryListView(
      {required List<String> images, double width = 120.0}) {
    return Container(
      padding: const EdgeInsets.only(top: 8.0),
      height: 180,
      width: double.infinity,
      child: ListView.builder(
        itemCount: images.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Image.asset(
                "assets/${images[index]}",
                width: width,
                fit: BoxFit.fill,
              ));
        },
      ),
    );
  }
}
