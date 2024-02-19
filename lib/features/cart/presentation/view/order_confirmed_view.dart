import 'package:flutter/material.dart';
import 'package:yallanshop/features/cart/presentation/view/widget/order_confirmed_view_body.dart';

class OrderConfirmedView extends StatelessWidget {
  const OrderConfirmedView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
      body: OrderConfirmedViewBody(),
    ));
  }
}
