part of 'cart_bloc.dart';

class CartState extends Equatable {
  final List<SepetYemek> sepetYemekler;
  final List<int> sepetYemeklerTotalFiyat;
  final int toplamFiyat;

  const CartState(
      {required this.sepetYemekler,
      required this.sepetYemeklerTotalFiyat,
      required this.toplamFiyat});

  CartState copyWith({
    List<SepetYemek>? sepetYemekler,
    List<int>? sepetYemeklerTotalFiyat,
    int? toplamFiyat,
  }) {
    return CartState(
      sepetYemekler: sepetYemekler ?? this.sepetYemekler,
      sepetYemeklerTotalFiyat:
          sepetYemeklerTotalFiyat ?? this.sepetYemeklerTotalFiyat,
      toplamFiyat: toplamFiyat ?? this.toplamFiyat,
    );
  }

  @override
  List<Object> get props =>
      [sepetYemekler.hashCode, sepetYemeklerTotalFiyat.hashCode,toplamFiyat];
}
