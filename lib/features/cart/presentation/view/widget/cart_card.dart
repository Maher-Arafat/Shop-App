import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:yallanshop/core/resources/app_size.dart';
import 'package:yallanshop/core/resources/colors_manager.dart';
import 'package:yallanshop/core/resources/style.dart';
import 'package:yallanshop/core/utils/app_router.dart';
import 'package:yallanshop/core/widgets/custom_network_Image.dart';
import 'package:yallanshop/features/cart/data/model/cart_model.dart';
import 'package:yallanshop/features/cart/presentation/cubits/cart_cubit.dart';
import 'package:yallanshop/features/cart/presentation/cubits/cart_state.dart';

class CartCard extends StatelessWidget {
  final CartItem cartItem;
  final int index;

  const CartCard({
    super.key,
    required this.cartItem,
    required this.index,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: PaddingSize.s20,
        vertical: PaddingSize.s10,
      ),
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          GestureDetector(
            onTap: () {}, // GoRouter.of(context).push(RouterPath.detailsView),
            child: Container(
              width: MediaQuery.sizeOf(context).width - 40,
              height: 140,
              decoration: BoxDecoration(
                color: ColorsManager.white,
                borderRadius: BorderRadius.circular(AppSize.s10),
                boxShadow: [
                  BoxShadow(
                    color: ColorsManager.darkWhite,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(PaddingSize.s10),
                    child: Container(
                      width: 110,
                      height: 110,
                      decoration: BoxDecoration(
                        color: ColorsManager.darkWhite,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: CustomNetWorkImage(
                        imageUrl: cartItem.product!.image!,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: SizedBox(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: MediaQuery.sizeOf(context).width - 200,
                            child: Text(
                              cartItem.product!.name!,
                              maxLines: 1,
                              style: StyleManager.title1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(height: 10),
                          /*BlocBuilder<CartCubit, CartState>(
                            builder: (context, state) {
                              return Row(
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        BlocProvider.of<CartCubit>(context)
                                            .itemCountDecrement(index)
                                            .toString(),
                                        style: StyleManager.title1,
                                      ),
                                      IconButton(
                                        onPressed:(){},
                                            //BlocProvider.of<CartCubit>(context).itemCountDecrement(index),
                                        icon: Icon(
                                          FontAwesomeIcons.minus,
                                          size: 20,
                                          color: ColorsManager.lightGrey,
                                        ),
                                      ),
                                      Text(
                                        BlocProvider.of<CartCubit>(context)
                                            .itemCountIncrement(index)
                                            .toString(),
                                        style: StyleManager.title1,
                                      ),
                                      IconButton(
                                        onPressed:(){},
                                            //BlocProvider.of<CartCubit>(context).itemCountIncrement(index),
                                        icon: Icon(
                                          FontAwesomeIcons.plus,
                                          size: 20,
                                          color: ColorsManager.lightGrey,
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      Text(
                                        '${cartItem.product!.price} \$',
                                        style: StyleManager.subtitle,
                                      ),
                                    ],
                                  )
                                ],
                              );
                            },
                          ),
                          const SizedBox(height: 15),
                          */
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(PaddingSize.s20),
            child: GestureDetector(
              onTap: () async {
                await BlocProvider.of<CartCubit>(context)
                    .addOrRemoveProduct(productId: cartItem.product!.id);
              },
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  border: Border.all(
                    color: ColorsManager.redColor,
                    width: 1.0,
                  ),
                ),
                child: Icon(
                  Icons.delete_outline_rounded,
                  size: 20,
                  color: ColorsManager.redColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
