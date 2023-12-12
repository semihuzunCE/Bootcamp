import 'package:bootcamp_bitirme_projesi/modules/cart/cart_bloc/cart_bloc.dart';
import 'package:bootcamp_bitirme_projesi/modules/home/home_bloc/home_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:flutter/material.dart';

Future<dynamic> alertShow(BuildContext context) {
  return QuickAlert.show(
      context: context,
      type: QuickAlertType.success,
      text: 'Your Order Has Been received!',
      onConfirmBtnTap: () {
        Navigator.pop(context);

        context.read<HomeBloc>().add(ChangePageIndex(pageIndex: 0));
        context.read<CartBloc>().add(DeleteAllSepetYemek());
      },
      confirmBtnText: "Okay");
}
