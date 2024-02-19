import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanshop/core/resources/app_strings.dart';
import 'package:yallanshop/core/resources/colors_manager.dart';
import 'package:yallanshop/core/resources/style.dart';
import 'package:yallanshop/features/favourite/presentation/view/widget/favourite_view_body.dart';
import 'package:yallanshop/features/home/presentation/cubits/product_cubit/get_product_cubit.dart';
import 'package:yallanshop/features/home/presentation/cubits/product_cubit/get_product_state.dart';

class FavouriteView extends StatelessWidget {
  const FavouriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            AppStrings.favourite,
            style: StyleManager.headLine3.copyWith(
              color: ColorsManager.black,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: const SafeArea(child: FavouriteViewBody()),
      );
    });
  }
}
