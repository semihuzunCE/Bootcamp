import 'package:bootcamp_bitirme_projesi/models/yemek.dart';

class YemekCevap {
  List<Yemek> yemekler;
  int success;
  YemekCevap({required this.yemekler, required this.success});

  factory YemekCevap.fromJson(Map<String, dynamic> json) {
    int success = json["success"] as int;
    var jsonArray = json["yemekler"] as List;
    List<Yemek> yemekler = jsonArray.map((e) => Yemek.fromJson(e)).toList();

    return YemekCevap(yemekler: yemekler, success: success);
  }
}
