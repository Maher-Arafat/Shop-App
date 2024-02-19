import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yallanshop/core/resources/app_size.dart';
import 'package:yallanshop/core/resources/app_strings.dart';
import 'package:yallanshop/core/resources/style.dart';
import 'package:yallanshop/core/utils/app_router.dart';
import 'package:yallanshop/features/cart/presentation/view/widget/address_ection.dart';
import 'package:yallanshop/features/cart/presentation/view/widget/cart_product_section.dart';
import 'package:yallanshop/features/cart/presentation/view/widget/order_info_section.dart';
import 'package:yallanshop/features/cart/presentation/view/widget/payment_section.dart';
import 'package:yallanshop/features/register/presentation/view/widget/custom_bottom_button.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: PaddingSize.s20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(AppStrings.cart, style: StyleManager.title1),
            ],
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: CartProductSection(),
                    ),
                    SliverToBoxAdapter(
                      child: AddressSection(),
                    ),
                    SliverToBoxAdapter(
                      child: PaymentSections(),
                    ),
                    SliverToBoxAdapter(
                      child: OrderInfoSection(),
                    ),
                  ],
                ),
              ),
              CustomBottomButton(
                text: AppStrings.checkOut,
                onPressed: () =>
                    GoRouter.of(context).push(RouterPath.orderConfirmedView),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
