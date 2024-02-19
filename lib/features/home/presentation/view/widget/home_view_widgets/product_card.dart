// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:yallanshop/core/resources/colors_manager.dart';
import 'package:yallanshop/core/resources/style.dart';
import 'package:yallanshop/core/shared/shared.dart';
import 'package:yallanshop/core/utils/app_router.dart';
import 'package:yallanshop/core/widgets/custom_network_Image.dart';

import 'package:yallanshop/features/home/data/model/product_model.dart';
import 'package:yallanshop/features/home/presentation/cubits/product_cubit/get_product_cubit.dart';
import 'package:yallanshop/features/home/presentation/cubits/product_cubit/get_product_state.dart';

class ProductCard extends StatelessWidget {
  final ProductDataModel product;
  const ProductCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => GoRouter.of(context).push(
        RouterPath.detailsView,
        extra: product,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              Container(
                width: 160,
                height: 200,
                decoration: BoxDecoration(
                  color: ColorsManager.darkWhite,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: CustomNetWorkImage(imageUrl: product.image!),
              ),
              BlocBuilder<ProductCubit, ProductState>(
                  builder: (context, state) {
                return IconButton(
                  onPressed: () {
                    BlocProvider.of<ProductCubit>(context)
                        .editFavProductsFromHome(product.id!);
                  },
                  icon: inFavorite[product.id]!
                      ? Icon(FontAwesomeIcons.heartCircleCheck,
                          color: ColorsManager.redColor)
                      : Icon(FontAwesomeIcons.heart,
                          color: ColorsManager.redColor),
                );
              }),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Text(
              product.name!,
              style: StyleManager.title3,
              maxLines: 2,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            '${product.price}\$',
            style: StyleManager.headLine3,
          ),
        ],
      ),
    );
  }
}
