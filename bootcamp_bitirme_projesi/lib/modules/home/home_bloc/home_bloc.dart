import 'dart:async';

import 'package:bootcamp_bitirme_projesi/models/yemek.dart';
import 'package:bootcamp_bitirme_projesi/repository/yemek_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc()
      : super(const HomeState(
            yemekler: [],
            pageIndex: 0,
            arananYemekler: [],
            favoriYemekler: [])) {
    on<GetAllYemek>(_getAllYemek);
    on<ChangePageIndex>(_changePageIndex);
    on<Ara>(_ara);
    on<ChangeLikeState>(_changeLikeState);
    on<AddFavouritesToList>(_addFavouritesToList);
  }

  FutureOr<void> _getAllYemek(
      GetAllYemek event, Emitter<HomeState> emit) async {
    var repo = YemekRepository();
    List<Yemek> yemekler = await repo.yemekleriYukle();
    emit(state.copyWith(yemekler: yemekler));
  }

  FutureOr<void> _changePageIndex(
      ChangePageIndex event, Emitter<HomeState> emit) {
    emit(state.copyWith(pageIndex: event.pageIndex));
  }

  FutureOr<void> _ara(Ara event, Emitter<HomeState> emit) {
    List<Yemek> filtrelenmisYemekler = state.yemekler
        .where((yemek) => yemek.yemek_adi
            .toLowerCase()
            .contains(event.arananKelime.toLowerCase()))
        .toList();
    emit(state.copyWith(arananYemekler: filtrelenmisYemekler));
  }

  FutureOr<void> _changeLikeState(
      ChangeLikeState event, Emitter<HomeState> emit) {
    List<Yemek> tempList = [...state.yemekler];
    for (int i = 0; i < tempList.length; i++) {
      if (tempList[i].yemek_id == event.yemek_id) {
        tempList[i].isLiked = !(tempList[i].isLiked);

        break;
      }
    }

    emit(state.copyWith(yemekler: tempList));
    add(AddFavouritesToList());
  }

  FutureOr<void> _addFavouritesToList(
      AddFavouritesToList event, Emitter<HomeState> emit) {
    List<Yemek> favoriler = [];
    for (int i = 0; i < state.yemekler.length; i++) {
      if (state.yemekler[i].isLiked) {
        favoriler.add(state.yemekler[i]);
      }
    }
    emit(state.copyWith(favoriYemekler: favoriler));
  }
}
