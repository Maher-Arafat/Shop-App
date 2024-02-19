import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:yallanshop/core/resources/app_size.dart';
import 'package:yallanshop/core/resources/colors_manager.dart';
import 'package:yallanshop/features/home/data/model/category_model.dart';

class BrandAppBar extends StatelessWidget {
  final CategoryDataModel brand;

  const BrandAppBar({Key? key, required this.brand}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: PaddingSize.s20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () => GoRouter.of(context).pop(),
            icon: const Icon(FontAwesomeIcons.arrowLeft),
          ),
          Container(
            width: 70,
            height: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: ColorsManager.darkWhite,
            ),
            child: Image.network(
              brand.image!,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.error_outline),
              fit: BoxFit.fill,
            ),
          ),
          IconButton(
            onPressed: () => GoRouter.of(context).pop(),
            icon: const Icon(FontAwesomeIcons.cartShopping),
          ),
        ],
      ),
    );
  }
}
