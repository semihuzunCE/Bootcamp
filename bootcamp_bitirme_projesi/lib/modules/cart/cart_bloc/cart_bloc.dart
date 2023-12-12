import 'dart:async';
import 'package:bootcamp_bitirme_projesi/models/sepet_yemek.dart';
import 'package:bootcamp_bitirme_projesi/repository/yemek_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc()
      : super(const CartState(
            sepetYemekler: [], sepetYemeklerTotalFiyat: [], toplamFiyat: 0)) {
    on<GetAllSepetYemek>(_getAllSepetYemek);
    on<SetSepetYemek>(_setSepetYemek);
    on<ChangeSepetYemekAdet>(_changeSepetYemekAdet);
    on<DeleteSepetYemek>(_deleteSepetYemek);
    on<SetSepetYemeklerFiyat>(_setSepetYemeklerFiyat);
    on<DeleteAllSepetYemek>(_deleteAllSepetYemek);
  }

  FutureOr<void> _getAllSepetYemek(
      GetAllSepetYemek event, Emitter<CartState> emit) async {
    var repo = YemekRepository();

    List<SepetYemek> sepetYemekler = await repo.sepetYemekleriYukle();

    emit(state.copyWith(sepetYemekler: sepetYemekler));
    add(SetSepetYemeklerFiyat());
  }

  FutureOr<void> _setSepetYemek(
      SetSepetYemek event, Emitter<CartState> emit) async {
    var repo = YemekRepository();
    int tempYemekAdeti = 0;
    for (int i = 0; i < state.sepetYemekler.length; i++) {
      if (event.yemek_adi == state.sepetYemekler[i].yemek_adi) {
        tempYemekAdeti = int.parse(state.sepetYemekler[i].yemek_siparis_adet);
        repo.sepetYemekSil(int.parse(state.sepetYemekler[i].sepet_yemek_id));
        break;
      }
    }

    await repo.sepeteEkle(
      event.yemek_adi,
      event.yemek_resim_adi,
      int.parse(event.yemek_fiyat),
      int.parse(event.yemek_siparis_adet) + tempYemekAdeti,
    );
    add(GetAllSepetYemek());
  }

  FutureOr<void> _changeSepetYemekAdet(
      ChangeSepetYemekAdet event, Emitter<CartState> emit) {
    List<SepetYemek> sepetYemekler = [...state.sepetYemekler];

    if (state.sepetYemekler.isNotEmpty) {
      int adet = int.parse(sepetYemekler[event.index].yemek_siparis_adet);

      if (!event.artir && adet > 0) {
        adet -= 1;
      } else if (event.artir) {
        adet += 1;
      }

      sepetYemekler[event.index].yemek_siparis_adet = adet.toString();
      emit(state.copyWith(sepetYemekler: sepetYemekler));
      add(SetSepetYemeklerFiyat());
    }
  }

  FutureOr<void> _deleteSepetYemek(
      DeleteSepetYemek event, Emitter<CartState> emit) async {
    var repo = YemekRepository();
    if (state.sepetYemekler.isNotEmpty) {
      await repo.sepetYemekSil(int.parse(event.sepet_yemek_id));
      add(GetAllSepetYemek());
    }
  }

  FutureOr<void> _setSepetYemeklerFiyat(
      SetSepetYemeklerFiyat event, Emitter<CartState> emit) {
    int toplamFiyat = 0;
    List<int> fiyatlar = [];
    if (state.sepetYemekler.isNotEmpty) {
      for (var sepetYemek in state.sepetYemekler) {
        fiyatlar.add((int.parse(sepetYemek.yemek_fiyat)) *
            (int.parse(sepetYemek.yemek_siparis_adet)));
      }
      toplamFiyat = fiyatlar.reduce((value, element) => value + element);
    }
    emit(state.copyWith(
        sepetYemeklerTotalFiyat: fiyatlar, toplamFiyat: toplamFiyat));
  }

  FutureOr<void> _deleteAllSepetYemek(
      DeleteAllSepetYemek event, Emitter<CartState> emit) async {
    var repo = YemekRepository();
    if (state.sepetYemekler.isNotEmpty) {
      for (int i = 0; i < state.sepetYemekler.length; i++) {
        await repo
            .sepetYemekSil((int.parse(state.sepetYemekler[i].sepet_yemek_id)));
      }
      add(GetAllSepetYemek());
    }
  }
}
