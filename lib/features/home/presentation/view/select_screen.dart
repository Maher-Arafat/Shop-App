// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:yallanshop/core/resources/app_strings.dart';
import 'package:yallanshop/core/resources/colors_manager.dart';
import 'package:yallanshop/features/home/presentation/cubits/product_cubit/get_product_cubit.dart';
import 'package:yallanshop/features/home/presentation/cubits/home_cubit/home_cubit.dart';
import 'package:yallanshop/features/home/presentation/cubits/home_cubit/home_state.dart';

import '../../../cart/presentation/cubits/cart_cubit.dart';

class SelectScreen extends StatefulWidget {
  const SelectScreen({super.key});

  @override
  State<SelectScreen> createState() => _SelectScreenState();
}

class _SelectScreenState extends State<SelectScreen> {
  getData() async {
    await BlocProvider.of<ProductCubit>(context).getProducts();
    BlocProvider.of<ProductCubit>(context).getFaouvriteProducts();
    BlocProvider.of<CartCubit>(context).getCartProducts();
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        var homeCubit = BlocProvider.of<HomeCubit>(context);
        return Scaffold(
          body: homeCubit.bottomScreens[homeCubit.crntIdx],
          bottomNavigationBar: GNav(
            padding: const EdgeInsets.all(15),
            iconSize: 25,
            color: ColorsManager.lightGrey,
            selectedIndex: homeCubit.crntIdx,
            gap: 8,
            onTabChange: (idx) =>
                BlocProvider.of<HomeCubit>(context).changeBottomScreen(idx),
            tabs: [
              const GButton(
                icon: FontAwesomeIcons.house,
                text: AppStrings.home,
                iconActiveColor: Color(0xff19398E),
                textColor: Color(0xff19398E),
              ),
              GButton(
                icon: FontAwesomeIcons.solidHeart,
                iconActiveColor: ColorsManager.primary,
                textColor: ColorsManager.primary,
                text: AppStrings.favourite,
                onPressed: () async {
                  await BlocProvider.of<ProductCubit>(context)
                      .getFaouvriteProducts();
                },
              ),
              GButton(
                icon: FontAwesomeIcons.cartShopping,
                iconActiveColor: ColorsManager.primary,
                textColor: ColorsManager.primary,
                text: AppStrings.cart,
                onPressed: () async {
                  await BlocProvider.of<CartCubit>(context).getCartProducts();
                },
              ),
              GButton(
                icon: FontAwesomeIcons.wallet,
                iconActiveColor: ColorsManager.primary,
                textColor: ColorsManager.primary,
                text: AppStrings.wallet,
              ),
            ],
          ),
        );
      },
    );
  }
}
