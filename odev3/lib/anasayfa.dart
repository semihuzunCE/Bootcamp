import 'package:flutter/material.dart';
import 'package:odev3/constants/renkler.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class AnaSayfa extends StatelessWidget {
  const AnaSayfa({super.key});

  @override
  Widget build(BuildContext context) {
    final double appHeight = MediaQuery.of(context).size.height;
    final double appWidth = MediaQuery.of(context).size.width;
    var s=AppLocalizations.of(context)!;
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [AppColors.backgroundColor1, AppColors.backgroundColor2],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    ElevatedButton(
                        onPressed: () {},
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(Icons.menu),
                            Text(
                              "MENU",
                              style: TextStyle(
                                  fontFamily: "Saira",
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        )),
                    const Spacer(),
                    Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.shopping_cart,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.person_outline,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        AppColors.backgroundColor1,
                        AppColors.backgroundColor2
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          s.anatolia,
                          style: TextStyle(
                              fontFamily: "Saira",
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textColor2),
                          maxLines: 2,
                        ),
                        Text(
                          s.visit,
                          style: TextStyle(
                              fontFamily: "Saira",
                              color: AppColors.textColor1,
                              fontSize: 22),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                    backgroundColor: AppColors.buttonColor1,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(4)))),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 4.0, horizontal: 16.0),
                                  child: Text(
                                    s.book,
                                    style: TextStyle(
                                        color: AppColors.textColor2,
                                        fontSize: 24.0,
                                        fontFamily: "Saira"),
                                  ),
                                )),
                            OutlinedButton(
                                onPressed: () {},
                                style: OutlinedButton.styleFrom(
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(4)))),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8.0, horizontal: 16.0),
                                  child: Text(
                                    s.information,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: AppColors.textColor2,
                                        fontSize: 24,
                                        fontFamily: "Saira"),
                                  ),
                                ))
                          ],
                        ),
                        const SizedBox(
                          height: 24.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              "images/resim1.jpg",
                              height: appHeight / 6,
                              width: appWidth * 60 / 100,
                              fit: BoxFit.cover,
                            ),
                            Image.asset(
                              "images/resim2.jpg",
                              height: appHeight / 6,
                              width: appWidth * 25 / 100,
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              "images/resim3.jpg",
                              height: appHeight / 6,
                              width: appWidth * 25 / 100,
                              fit: BoxFit.cover,
                            ),
                            Image.asset(
                              "images/resim4.jpg",
                              height: appHeight / 6,
                              width: appWidth * 60 / 100,
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          width: double.infinity,
                          child: OutlinedButton(
                              onPressed: () {},
                              style: OutlinedButton.styleFrom(
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(4)))),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 16.0),
                                child: Text(
                                  s.donate,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: AppColors.textColor2,
                                      fontSize: 22,
                                      fontFamily: "Saira"),
                                ),
                              )),
                        ),
                         Center(
                            child: Text(
                          s.open,
                          style: TextStyle(
                              fontFamily: "Saira",
                              color: AppColors.textColor2,
                              fontSize: 20),
                        )) 
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
