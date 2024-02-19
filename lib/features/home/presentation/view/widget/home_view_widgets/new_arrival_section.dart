import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:yallanshop/core/resources/app_size.dart';
import 'package:yallanshop/core/resources/app_strings.dart';
import 'package:yallanshop/core/resources/colors_manager.dart';
import 'package:yallanshop/core/resources/style.dart';
import 'package:yallanshop/features/home/presentation/cubits/product_cubit/get_product_cubit.dart';
import 'package:yallanshop/features/home/presentation/cubits/product_cubit/get_product_state.dart';
import 'package:yallanshop/features/home/presentation/view/widget/home_view_widgets/product_gird_view.dart';

class NewArrivalSection extends StatelessWidget {
  const NewArrivalSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: PaddingSize.s10),
          child: Text(AppStrings.newArrival, style: StyleManager.headLine3),
        ),
        BlocBuilder<ProductCubit, ProductState>(builder: (context, state) {
          return ConditionalBuilder(
            condition:
                BlocProvider.of<ProductCubit>(context).productList != null,
            builder: (context) => ProductGridView(
              productList: BlocProvider.of<ProductCubit>(context).productList!,
            ),
            fallback: (context) => Shimmer.fromColors(
              baseColor: ColorsManager.darkWhite,
              highlightColor: Colors.grey[100]!,
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: 6,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 10,
                  childAspectRatio: 1 / 1.8,
                ),
                itemBuilder: (context, index) => Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 160,
                      height: 203,
                      decoration: BoxDecoration(
                        color: ColorsManager.darkWhite,
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: 160,
                      height: 10,
                      decoration: BoxDecoration(
                        color: ColorsManager.darkWhite,
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: 100,
                      height: 10,
                      decoration: BoxDecoration(
                        color: ColorsManager.darkWhite,
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ],
    );
  }
}
