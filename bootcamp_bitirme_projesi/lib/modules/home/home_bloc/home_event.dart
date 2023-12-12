// ignore_for_file: non_constant_identifier_names

part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {}

class GetAllYemek extends HomeEvent {
  @override
  List<Object?> get props => [];
}

class ChangePageIndex extends HomeEvent {
  final int pageIndex;
  ChangePageIndex({required this.pageIndex});
  @override
  List<Object?> get props => [];
}

class Ara extends HomeEvent {
  final String arananKelime;
  Ara({required this.arananKelime});
  @override
  List<Object?> get props => [];
}

class ChangeLikeState extends HomeEvent {
  final String yemek_id;
  ChangeLikeState({required this.yemek_id});
  @override
  List<Object?> get props => [];
}

class AddFavouritesToList extends HomeEvent {
  @override
  List<Object?> get props => [];
}
