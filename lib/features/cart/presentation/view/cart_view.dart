import 'package:flutter/material.dart';
import 'package:yallanshop/core/resources/colors_manager.dart';
import 'package:yallanshop/features/cart/presentation/view/widget/cart_view_body.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: ColorsManager.white,
      body: const CartViewBody(),
    ));
  }
}
