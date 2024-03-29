// ignore_for_file: non_constant_identifier_names

class Yemek {
  String yemek_id;
  String yemek_adi;
  String yemek_resim_adi;
  String yemek_fiyat;
  bool isLiked=false;

  Yemek({
    required this.yemek_id,
    required this.yemek_adi,
    required this.yemek_resim_adi,
    required this.yemek_fiyat,
  });

   factory Yemek.fromJson(Map<String, dynamic> json) {
    return Yemek(
      yemek_id: json["yemek_id"] as String,
      yemek_adi: json["yemek_adi"] as String,
      yemek_resim_adi: json["yemek_resim_adi"] as String,
      yemek_fiyat: json["yemek_fiyat"] as String,
    );
  } 

  @override
  String toString() {
    return "yemek id : $yemek_id";
  }
}
