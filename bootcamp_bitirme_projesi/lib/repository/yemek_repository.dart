// ignore_for_file: non_constant_identifier_names, avoid_print

import 'dart:convert';

import 'package:bootcamp_bitirme_projesi/constants/api_endpoints.dart';
import 'package:bootcamp_bitirme_projesi/models/sepet_yemek.dart';
import 'package:bootcamp_bitirme_projesi/models/sepet_yemek_cevap.dart';
import 'package:bootcamp_bitirme_projesi/models/yemek.dart';
import 'package:bootcamp_bitirme_projesi/models/yemek_cevap.dart';
import 'package:dio/dio.dart';

class YemekRepository {
  List<Yemek> parseYemekCevap(String cevap) {
    return YemekCevap.fromJson(json.decode(cevap)).yemekler;
  }

  List<SepetYemek> parseSepetYemek(String cevap) {
    try {
      if (cevap.isNotEmpty) {
        Map<String, dynamic> jsonCevap = json.decode(cevap);
        print("repo parse $jsonCevap}");
        return SepetYemekCevap.fromJson(jsonCevap).sepetYemekler;
      } else {
        // Gelen cevap boş veya geçerli bir JSON formatına sahip değilse boş liste döndür.
        return [];
      }
    } catch (e) {
      // JSON ayrıştırma hatası durumunda boş liste döndür.
      print("JSON ayrıştırma hatası: $e");
      return [];
    }
  }

  Future<List<Yemek>> yemekleriYukle() async {
    var cevap = await Dio().get(ApiEndpoints.getUrl);

    return parseYemekCevap(cevap.data.toString());
  }

  Future<List<SepetYemek>> sepetYemekleriYukle(
      {String kullanici_adi = "semih"}) async {
    var veri = {"kullanici_adi": kullanici_adi};
    var cevap =
        await Dio().post(ApiEndpoints.cartGetUrl, data: FormData.fromMap(veri));

    print("sepetteki yemekleri yükle : ${cevap.data.toString()}");
    return parseSepetYemek(cevap.data.toString());
  }

  Future<void> sepeteEkle(String yemek_adi, String yemek_resim_adi,
      int yemek_fiyat, int yemek_siparis_adet,
      {String kullanici_adi = "semih"}) async {
    var veri = {
      "yemek_adi": yemek_adi,
      "yemek_resim_adi": yemek_resim_adi,
      "yemek_fiyat": yemek_fiyat,
      "yemek_siparis_adet": yemek_siparis_adet,
      "kullanici_adi": kullanici_adi,
    };
    var cevap =
        await Dio().post(ApiEndpoints.postUrl, data: FormData.fromMap(veri));
    print("yemek ekle : ${cevap.data.toString()}");
  }

  Future<void> sepetYemekSil(int sepet_yemek_id,
      {String kullanici_adi = "semih"}) async {
    var veri = {
      "sepet_yemek_id": sepet_yemek_id,
      "kullanici_adi": kullanici_adi
    };
    var cevap = await Dio()
        .post(ApiEndpoints.cartDeleteUrl, data: FormData.fromMap(veri));
    print("kişi sil : ${cevap.data.toString()}");
  }
}
