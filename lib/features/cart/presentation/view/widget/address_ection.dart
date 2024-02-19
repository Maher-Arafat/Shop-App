import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:yallanshop/core/resources/app_size.dart';
import 'package:yallanshop/core/resources/app_strings.dart';
import 'package:yallanshop/core/resources/assets_manager.dart';
import 'package:yallanshop/core/resources/style.dart';
import 'package:yallanshop/core/utils/app_router.dart';
import 'package:yallanshop/features/address/presentation/cubits/address_cubit.dart';
import 'package:yallanshop/features/cart/presentation/view/widget/cart_details.dart';

class AddressSection extends StatelessWidget {
  const AddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => GoRouter.of(context).push(RouterPath.addresView),
      child: Padding(
        padding: const EdgeInsets.all(PaddingSize.s20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.deliveryAddress,
              style: StyleManager.headLine3,
            ),
            CartDetailsCard(
              title: BlocProvider.of<AddressCubit>(context).name ??
                 AppStrings.noCurrentAddress ,
              image: AssetsManager.mapImage,
              subTitle: BlocProvider.of<AddressCubit>(context).country ??
                  AppStrings.addAddressData,
            ),
          ],
        ),
      ),
    );
  }
}
