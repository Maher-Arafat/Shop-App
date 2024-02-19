import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanshop/core/resources/app_size.dart';
import 'package:yallanshop/core/resources/app_strings.dart';
import 'package:yallanshop/core/resources/colors_manager.dart';
import 'package:yallanshop/core/resources/style.dart';
import 'package:yallanshop/core/widgets/custom_progress_indicator.dart';
import 'package:yallanshop/features/home/data/model/category_model.dart';
import 'package:yallanshop/features/home/presentation/cubits/brand_products_cubit/get_brand_products_cubit.dart';
import 'package:yallanshop/features/home/presentation/cubits/brand_products_cubit/get_brand_products_state.dart';
import 'package:yallanshop/features/home/presentation/view/widget/brand_view_widgets/brand_app_bar.dart';
import 'package:yallanshop/features/home/presentation/view/widget/home_view_widgets/product_gird_view.dart';

class BrandViewBody extends StatelessWidget {
  final CategoryDataModel brand;

  const BrandViewBody({Key? key, required this.brand}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: PaddingSize.s20),
        child: Column(
          children: [
            BrandAppBar(brand: brand),
            BlocBuilder<GetBrandProductsCubit, GetBrandProductsState>(
              builder: (context, state) {
                if (state is GetBrandProductsSuccessState) {
                  return Expanded(
                    child: Column(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(bottom: PaddingSize.s20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${state.productList.length} Items',
                                    style: StyleManager.headLine4,
                                  ),
                                ],
                              ),
                              Container(
                                width: 70,
                                height: 37,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: ColorsManager.darkWhite,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.sort),
                                    const SizedBox(width: 5),
                                    Text(
                                      AppStrings.sort,
                                      style: StyleManager.title2,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child:
                              ProductGridView(productList: state.productList),
                        )
                      ],
                    ),
                  );
                } else if (state is GetBrandProductsErrorState) {
                  return Text(state.error);
                } else {
                  return const CustomProgressIndicator();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
