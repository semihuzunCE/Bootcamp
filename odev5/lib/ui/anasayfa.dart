import 'package:flutter/material.dart';
import 'package:odev5/constants/app_colors.dart';

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({super.key});

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  var tfController1 = TextEditingController();
  var tfController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 50.0),
        child: Column(
          children: [
            SizedBox(
              height: screenHeight * 0.3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextField(
                    style: const TextStyle(color: Colors.white, fontSize: 22),
                    readOnly: true,
                    cursorOpacityAnimates: false,
                    textAlign: TextAlign.end,
                    controller: tfController1,
                    decoration: const InputDecoration(border: InputBorder.none),
                    onChanged: (value) {
                      setState(() {
                        tfController1.text = value;
                      });
                    },
                  ),
                  TextField(
                    style: const TextStyle(color: Colors.white, fontSize: 42),
                    readOnly: true,
                    textAlign: TextAlign.end,
                    controller: tfController2,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                    onChanged: (value) {
                      setState(() {
                        tfController2.text = value;
                      });
                    },
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                ],
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.appGrey),
                      onPressed: () {
                        setState(() {
                          tfController1.clear();
                          tfController2.clear();
                        });
                      },
                      child: Text(
                        "Clear",
                        style: TextStyle(color: AppColors.symbolWhite),
                      )),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          myRoundedButton(
                            symbol: "7",
                          ),
                          myRoundedButton(
                            symbol: "4",
                          ),
                          myRoundedButton(
                            symbol: "1",
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          myRoundedButton(
                            symbol: "8",
                          ),
                          myRoundedButton(
                            symbol: "5",
                          ),
                          myRoundedButton(
                            symbol: "2",
                          ),
                          myRoundedButton(
                            symbol: "0",
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          myRoundedButton(
                            symbol: "9",
                          ),
                          myRoundedButton(
                            symbol: "6",
                          ),
                          myRoundedButton(
                            symbol: "3",
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            margin: const EdgeInsets.all(8.0),
                            child: RotatedBox(
                                quarterTurns: 1,
                                child: SizedBox(
                                    width: 214,
                                    height: 50,
                                    child: ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            if (tfController2.text.isNotEmpty &&
                                                !tfController2.text
                                                    .endsWith("+")) {
                                              tfController2.text += "+";
                                            }
                                          });
                                        },
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: AppColors.appGrey),
                                        child: Text(
                                          "+",
                                          style: TextStyle(
                                              color: AppColors.symbolWhite),
                                        )))),
                          ),
                          myRoundedButton(
                              symbol: "=",
                              backgroundColor: AppColors.appOrange),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  GestureDetector myRoundedButton(
      {required String symbol, Color backgroundColor = Colors.transparent}) {
    return GestureDetector(
      onTap: () {
        var split = <String>[];
        int sonuc = 0;
        setState(() {
          if (checkNumeric(symbol)) {
            tfController2.text += symbol;
          } else {
            if (tfController2.text.contains("+")) {
              if (tfController2.text.endsWith("+")) {
                tfController2.text = tfController2.text
                    .substring(0, tfController2.text.length - 1);
              }
              split = tfController2.text.split("+");
              tfController1.text = tfController2.text;
              for (int i = 0; i < split.length; i++) {
                sonuc += int.parse(split[i]);
              }
              tfController2.text = sonuc.toString();
            }
          }
        });
      },
      child: Container(
        margin: const EdgeInsets.all(8.0),
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white30, width: 0.5),
          shape: BoxShape.circle,
          color: backgroundColor,
        ),
        child: Center(
          child: Text(
            symbol,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

bool checkNumeric(String char) {
  int? result = int.tryParse(char);

  if (result != null) {
    return true;
  } else {
    return false;
  }
}
