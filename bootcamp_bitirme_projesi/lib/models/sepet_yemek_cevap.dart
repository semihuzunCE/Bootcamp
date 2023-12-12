import 'package:bootcamp_bitirme_projesi/models/sepet_yemek.dart';

class SepetYemekCevap {
  List<SepetYemek> sepetYemekler;
  int success;
  SepetYemekCevap({required this.sepetYemekler, required this.success});

  factory SepetYemekCevap.fromJson(Map<String, dynamic> json) {
    int success = json["success"] as int;
    var jsonArray = json["sepet_yemekler"] as List;
    List<SepetYemek> sepetYemekler =
        jsonArray.map((e) => SepetYemek.fromJson(e)).toList();

    return SepetYemekCevap(sepetYemekler: sepetYemekler, success: success);
  }
}
