// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/widgets.dart';

import 'package:yallanshop/features/home/data/model/product_model.dart';
import 'package:yallanshop/features/home/presentation/view/widget/home_view_widgets/product_card.dart';

class ProductGridView extends StatelessWidget {
  final List<ProductDataModel> productList;
  const ProductGridView({
    Key? key,
    required this.productList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics:const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 2 / 3.5,
      ),
      itemBuilder: (context, index) => ProductCard(product: productList[index]),
      itemCount: productList.length,
    );
  }
}
