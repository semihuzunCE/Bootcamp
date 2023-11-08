import 'package:flutter/material.dart';

class SayfaY extends StatelessWidget {
  const SayfaY({super.key});

  @override
  Widget build(BuildContext context) {
    Future<bool> geriDonusTusu(BuildContext context) async {
      Navigator.of(context).popUntil((route) => route.isFirst);
      return false;
    }

    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(title: const Text("Sayfa Y")),
      body: WillPopScope(
        onWillPop: () => geriDonusTusu(context),
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [],
          ),
        ),
      ),
    );
  }
}
