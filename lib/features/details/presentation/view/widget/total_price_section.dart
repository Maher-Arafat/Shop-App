import 'package:flutter/material.dart';
import 'package:yallanshop/core/resources/app_strings.dart';
import '../../../../../core/resources/style.dart';
import '../../../../home/data/model/product_model.dart';

class TotalPriceSection extends StatelessWidget {
  const TotalPriceSection({Key? key, required this.product}) : super(key: key);
  final ProductDataModel product;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                AppStrings.totalPrice,
                style: StyleManager.headLine3,
              ),
              Text(
                AppStrings.totalWithVAT,
                style: StyleManager.subtitle2,
              ),
            ],
          ),
          Text(
            "${product.price}\$",
            style: StyleManager.headLine3,
          ),
        ],
      ),
    );
  }
}
