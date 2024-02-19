// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanshop/core/utils/service_locator.dart';

import 'package:yallanshop/features/home/data/model/category_model.dart';
import 'package:yallanshop/features/home/data/repos/details_repo/details_repo.dart';
import 'package:yallanshop/features/home/presentation/cubits/brand_products_cubit/get_brand_products_cubit.dart';
import 'package:yallanshop/features/home/presentation/view/widget/brand_view_widgets/brand_body.dart';

class BrandView extends StatelessWidget {
  final CategoryDataModel brand;
  const BrandView({
    Key? key,
    required this.brand,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => GetBrandProductsCubit(di<DetailsRepo>())
          ..getBrandProducts(categoryId: brand.id!),
        child: BrandViewBody(brand: brand),
      ),
    );
  }
}
