import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanshop/core/resources/app_size.dart';
import 'package:yallanshop/core/resources/app_strings.dart';
import 'package:yallanshop/core/resources/colors_manager.dart';
import 'package:yallanshop/core/resources/style.dart';
import 'package:yallanshop/features/favourite/presentation/cubits/cart_product_cubit/favourite_product_state.dart';
import 'package:yallanshop/features/favourite/presentation/view/widget/favourite_card.dart';
import 'package:yallanshop/features/home/presentation/cubits/product_cubit/get_product_cubit.dart';
import 'package:yallanshop/features/home/presentation/cubits/product_cubit/get_product_state.dart';

import '../../../../cart/presentation/view/widget/cart_product_shimmer.dart';

class FavouriteViewBody extends StatefulWidget {
  const FavouriteViewBody({super.key});

  @override
  State<FavouriteViewBody> createState() => _FavouriteViewBodyState();
}

class _FavouriteViewBodyState extends State<FavouriteViewBody> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: PaddingSize.s20),
      child: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          return ConditionalBuilder(
            condition: state is! FavouriteProductLoadingState,
            builder: (context) {
              return Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: PaddingSize.s20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${BlocProvider.of<ProductCubit>(context).favProductList!.length} Items',
                              style: StyleManager.title1,
                            ),
                            Text(
                              AppStrings.inFavourites,
                              style: StyleManager.subtitle,
                            ),
                          ],
                        ),
                        Container(
                          width: 68,
                          height: 37,
                          decoration: BoxDecoration(
                            color: ColorsManager.darkWhite,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              AppStrings.edit,
                              style: StyleManager.title1,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: PaddingSize.s10),
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: BlocProvider.of<ProductCubit>(context)
                            .favProductList!
                            .length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding:
                                const EdgeInsets.only(bottom: PaddingSize.s20),
                            child: Dismissible(
                              key: UniqueKey(),
                              direction: DismissDirection.endToStart,
                              background: Container(
                                alignment: AlignmentDirectional.centerEnd,
                                decoration: BoxDecoration(
                                  color: ColorsManager.redColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(20),
                                  child: Icon(
                                    Icons.delete,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              child: FavouriteCard(
                                productModel:
                                    BlocProvider.of<ProductCubit>(context)
                                        .favProductList![index],
                              ),
                              onDismissed: (direction) {
                                BlocProvider.of<ProductCubit>(context)
                                    .editFavProductsFromHome(
                                  BlocProvider.of<ProductCubit>(context)
                                      .favProductList![index]
                                      .product!
                                      .id!,
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              );
            },
            fallback: (context) => const CartProductShimmer(),
          );
        },
      ),
    );
  }
}
