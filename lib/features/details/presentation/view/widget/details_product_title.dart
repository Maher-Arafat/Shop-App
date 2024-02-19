import 'package:flutter/cupertino.dart';
import 'package:yallanshop/core/resources/app_strings.dart';

import '../../../../../core/resources/style.dart';

class DetailsProductTitle extends StatelessWidget {
  final String productName;
  final double productPrice;

  const DetailsProductTitle({
    Key? key,
    required this.productName,
    required this.productPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                AppStrings.product,
              ),
              Text(
                productName,
                style: StyleManager.headLine4,
                softWrap: true,
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.price,
              style: StyleManager.subtitle,
            ),
            Text(
              "$productPrice\$",
              style: StyleManager.headLine4,
            ),
          ],
        )
      ],
    );
  }
}
