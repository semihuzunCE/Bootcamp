class Metodlar {
  static double soru1(double km) {
    return km * 0.621;
  }

  static double soru2(double kisaKenar, double uzunKenar) {
    return kisaKenar * uzunKenar;
  }

  static int soru3(int faktoriyel) {
    if (faktoriyel == 0) {
      return 1;
    } else
      return soru3(faktoriyel - 1) * faktoriyel;
  }

  static int soru4(String kelime) {
    int count = 0;
    for (var i = 0; i < kelime.length; i++) {
      if (kelime[i] == 'e') {
        count++;
      }
    }
    return count;
  }

  static double soru5(double kenarSayisi) {
    return (((kenarSayisi - 2) * 180) / kenarSayisi);
  }

  static int soru6(int gun) {
    int maas = 0;
    if (gun * 8 > 150) {
      int mesaiUcreti = ((gun * 8 - 150)) * 80;
      maas = mesaiUcreti + 150 * 40;
      return maas;
    }
    maas = gun * 8 * 40;
    return maas;
  }

  static int soru7(int saat) {
    int ucret = 0;
    if (saat >= 1) {
      ucret = 50 + (saat - 1) * 10;
      return ucret;
    } else {
      return 0;
    }
  }
}
