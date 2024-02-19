// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:yallanshop/features/details/presentation/view/widget/details_body.dart';

import 'package:yallanshop/features/home/data/model/product_model.dart';

class DetailsView extends StatelessWidget {
  final ProductDataModel product;
  const DetailsView({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DetailsViewBody(product: product),
    );
  }
}
