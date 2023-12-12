part of 'home_bloc.dart';

class HomeState extends Equatable {
  final List<Yemek> yemekler;
  final List<Yemek> arananYemekler;
  final List<Yemek> favoriYemekler;
  final int pageIndex;

  const HomeState({
    required this.yemekler,
    required this.pageIndex,
    required this.arananYemekler,
    required this.favoriYemekler,
  });

  HomeState copyWith(
      {List<Yemek>? yemekler,
      int? pageIndex,
      List<Yemek>? arananYemekler,
      List<Yemek>? favoriYemekler}) {
    return HomeState(
      yemekler: yemekler ?? this.yemekler,
      pageIndex: pageIndex ?? this.pageIndex,
      arananYemekler: arananYemekler ?? this.arananYemekler,
      favoriYemekler: favoriYemekler ?? this.favoriYemekler,
    );
  }

  @override
  List<Object> get props => [
        yemekler.hashCode,
        pageIndex,
        arananYemekler.hashCode,
        favoriYemekler.hashCode
      ];
}
