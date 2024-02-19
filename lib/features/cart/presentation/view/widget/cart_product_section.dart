import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanshop/core/resources/app_strings.dart';
import 'package:yallanshop/features/cart/presentation/cubits/cart_cubit.dart';
import 'package:yallanshop/features/cart/presentation/cubits/cart_state.dart';
import 'package:yallanshop/features/cart/presentation/view/widget/cart_card.dart';
import 'package:yallanshop/features/cart/presentation/view/widget/cart_product_shimmer.dart';

class CartProductSection extends StatelessWidget {
  const CartProductSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      width: MediaQuery.sizeOf(context).width,
      child: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          return ConditionalBuilder(
            condition: BlocProvider.of<CartCubit>(context).cartModel != null,
            builder: (context) {
              if (BlocProvider.of<CartCubit>(context)
                  .cartModel!
                  .data!
                  .cartItems
                  .isNotEmpty) {
                return ConditionalBuilder(
                  condition: state is AddOrRemoveProductSuccessState ||
                      state is CartSuccessState,
                  builder: (context) => ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: BlocProvider.of<CartCubit>(context)
                        .cartModel!
                        .data!
                        .cartItems
                        .length,
                    itemBuilder: (context, index) => CartCard(
                      cartItem: BlocProvider.of<CartCubit>(context)
                          .cartModel!
                          .data!
                          .cartItems[index],
                      index: index,
                    ),
                  ),
                  fallback: (context) => const CartProductShimmer(),
                );
              } else {
                return const Center(
                  child: Text(AppStrings.noItemsInCart),
                );
              }
            },
            fallback: (context) => const Padding(
              padding: EdgeInsets.only(top: 10),
              child: CartProductShimmer(),
            ),
          );
        },
      ),
    );
  }
}
