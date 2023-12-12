import 'package:bootcamp_bitirme_projesi/constants/app_colors.dart';
import 'package:bootcamp_bitirme_projesi/modules/cart/cart.dart';
import 'package:bootcamp_bitirme_projesi/modules/favourites/favourite.dart';
import 'package:bootcamp_bitirme_projesi/modules/home/home.dart';
import 'package:bootcamp_bitirme_projesi/modules/home/home_bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBase extends StatefulWidget {
  const HomeBase({super.key});

  @override
  State<HomeBase> createState() => _HomeBaseState();
}

class _HomeBaseState extends State<HomeBase> {
  final List<Widget> widgetList = const [Home(), Favourites(), Cart()];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: AppColors.appOrange,
            onTap: (value) {
              context.read<HomeBloc>().add(ChangePageIndex(pageIndex: value));
              
            },
              type: BottomNavigationBarType.fixed,
              items:  [
                BottomNavigationBarItem(label: "", icon: Icon(Icons.home,color: state.pageIndex==0?AppColors.appOrange:Colors.grey,)),
                BottomNavigationBarItem(label: "", icon: Icon(Icons.favorite,color: state.pageIndex==1?AppColors.appOrange:Colors.grey,)),
                BottomNavigationBarItem(
                    label: "", icon: Icon(Icons.shopping_cart,color: state.pageIndex==2?AppColors.appOrange:Colors.grey,)),
              ]),
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: const Icon(
              Icons.menu,
              color: Colors.black,
            ),
            actions: const [
              Padding(
                padding: EdgeInsets.only(right: 16.0),
                child: Icon(
                  Icons.person,
                  color: Colors.black,
                ),
              )
            ],
          ),
          body: widgetList[state.pageIndex],
        );
      },
    );
  }
}
