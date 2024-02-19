import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanshop/features/favourite/presentation/view/favourite_view.dart';
import 'package:yallanshop/features/home/presentation/cubits/home_cubit/home_state.dart';
import 'package:yallanshop/features/home/presentation/view/home_view.dart';

import '../../../../cart/presentation/view/cart_view.dart';
import '../../../../payment/presentation/view/payment_view.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState());
  int crntIdx = 0;
  List<Widget> bottomScreens = [
    const HomeView(),
    const FavouriteView(),
    const CartView(),
    const PaymentView(),
  ];
  void changeBottomScreen(int idx) {
    crntIdx = idx;
    emit(ChangeBottomNavState());
  }
}
