// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanshop/core/resources/app_size.dart';
import 'package:yallanshop/core/resources/app_strings.dart';
import 'package:yallanshop/core/shared/shared.dart';
import 'package:yallanshop/features/details/presentation/view/widget/details_app_bar.dart';
import 'package:yallanshop/features/details/presentation/view/widget/details_product_title.dart';
import 'package:yallanshop/features/details/presentation/view/widget/photos_list_view.dart';
import 'package:yallanshop/features/details/presentation/view/widget/total_price_section.dart';

import 'package:yallanshop/features/home/data/model/product_model.dart';
import 'package:yallanshop/features/register/presentation/view/widget/custom_bottom_button.dart';

import '../../../../cart/presentation/cubits/cart_cubit.dart';
import '../../../../cart/presentation/cubits/cart_state.dart';

class DetailsViewBody extends StatelessWidget {
  final ProductDataModel product;
  const DetailsViewBody({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                DetailsAppBar(product: product),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: PaddingSize.s20,
                      vertical: PaddingSize.s15,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DetailsProductTitle(
                          productName: product.name!,
                          productPrice: product.price!,
                        ),
                        PhotosListView(imagesList: product.images),
                        TotalPriceSection(product: product),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BlocBuilder<CartCubit, CartState>(builder: (context, state) {
            return CustomBottomButton(
              text: inCartMap[product.id]! ? AppStrings.removeFromCart : AppStrings.addToCart,
              onPressed: () {
                BlocProvider.of<CartCubit>(context).addOrRemoveProduct(
                  productId: product.id,
                );
              },
            );
          })
        ],
      ),
    );
  }
}
