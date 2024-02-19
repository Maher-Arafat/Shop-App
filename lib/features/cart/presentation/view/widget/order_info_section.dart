import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanshop/core/resources/app_strings.dart';
import 'package:yallanshop/core/resources/style.dart';
import 'package:yallanshop/core/widgets/custom_progress_indicator.dart';
import 'package:yallanshop/features/cart/presentation/cubits/cart_cubit.dart';
import 'package:yallanshop/features/cart/presentation/cubits/cart_state.dart';
import 'package:yallanshop/features/cart/presentation/view/widget/order_info_card.dart';

class OrderInfoSection extends StatelessWidget {
  const OrderInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return ConditionalBuilder(
          condition: BlocProvider.of<CartCubit>(context).cartModel != null,
          builder: (context) => Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.orderInfo,
                      style: StyleManager.headLine3,
                    ),
                    const SizedBox(height: 20),
                    Column(
                      children: [
                        OrderInfoCard(
                          title: AppStrings.subTotal,
                          price: BlocProvider.of<CartCubit>(context)
                              .subTotl
                              .toString(),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: OrderInfoCard(
                            title: AppStrings.shoppingCart,
                            price: '0',
                          ),
                        ),
                        OrderInfoCard(
                          title: AppStrings.total,
                          price: BlocProvider.of<CartCubit>(context)
                              .subTotl
                              .toString(),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          fallback: (context) => const Padding(
            padding: EdgeInsets.only(top: 10),
            child: CustomProgressIndicator(),
          ),
        );
      },
    );
  }
}
