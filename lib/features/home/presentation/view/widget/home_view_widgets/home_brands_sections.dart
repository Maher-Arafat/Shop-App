import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:yallanshop/core/resources/app_size.dart';
import 'package:yallanshop/core/resources/app_strings.dart';
import 'package:yallanshop/core/resources/colors_manager.dart';
import 'package:yallanshop/core/resources/style.dart';
import 'package:yallanshop/features/home/presentation/cubits/brand_cubit/get_brand_cubit.dart';
import 'package:yallanshop/features/home/presentation/cubits/brand_cubit/get_brand_state.dart';
import 'package:yallanshop/features/home/presentation/view/widget/home_view_widgets/brand_list_view.dart';
import 'package:yallanshop/features/home/presentation/view/widget/home_view_widgets/brand_shimmer.dart';

class HomeBrandSections extends StatelessWidget {
  const HomeBrandSections({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: PaddingSize.s20),
          child: Text(
            AppStrings.chooseBrand,
            style: StyleManager.headLine3,
          ),
        ),
        BlocBuilder<GetBrandCubit, GetBrandState>(builder: (context, state) {
          if (state is GetBrandSuccessState) {
            return BrandListView(brandList: state.brandList);
          } else if (state is GetBrandErrorState) {
            return Center(
              child: Text(state.error),
            );
          } else {
            return Shimmer.fromColors(
              baseColor: ColorsManager.darkWhite,
              highlightColor: Colors.grey[100]!,
              child: const BrandsShimmer(),
            );
          }
        }),
      ],
    );
  }
}
