// ignore_for_file: non_constant_identifier_names

part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {}

class GetAllSepetYemek extends CartEvent {
  @override
  List<Object?> get props => [];
}

class SetSepetYemek extends CartEvent {
  final String yemek_adi;
  final String yemek_resim_adi;
  final String yemek_fiyat;
  final String yemek_siparis_adet;
  SetSepetYemek(
      {required this.yemek_adi,
      required this.yemek_resim_adi,
      required this.yemek_fiyat,
      required this.yemek_siparis_adet});
  @override
  List<Object?> get props =>
      [yemek_siparis_adet, yemek_resim_adi, yemek_fiyat, yemek_siparis_adet];
}

class ChangeSepetYemekAdet extends CartEvent {
  final int index;
  final bool artir;
  ChangeSepetYemekAdet({required this.index, this.artir = true});
  @override
  List<Object?> get props => [index, artir];
}

class DeleteSepetYemek extends CartEvent {
  final String sepet_yemek_id;
  DeleteSepetYemek({required this.sepet_yemek_id});
  @override
  List<Object?> get props => [sepet_yemek_id];
}

class SetSepetYemeklerFiyat extends CartEvent {
  @override
  List<Object?> get props => [];
}

class DeleteAllSepetYemek extends CartEvent {
  @override
  List<Object?> get props => [];
}
