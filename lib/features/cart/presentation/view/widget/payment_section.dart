import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:yallanshop/core/resources/app_strings.dart';
import 'package:yallanshop/core/resources/assets_manager.dart';
import 'package:yallanshop/core/resources/style.dart';
import 'package:yallanshop/core/utils/app_router.dart';
import 'package:yallanshop/features/cart/presentation/view/widget/cart_details.dart';
import 'package:yallanshop/features/payment/presentation/cubits/payment/payment_cubit.dart';

class PaymentSections extends StatelessWidget {
  const PaymentSections({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentCubit, PaymentState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.paymentMethod,
                style: StyleManager.headLine3,
              ),
              GestureDetector(
                onTap: () => GoRouter.of(context).push(RouterPath.paymentView),
                child: CartDetailsCard(
                  title: BlocProvider.of<PaymentCubit>(context).ownerName ??
                      AppStrings.noMethods,
                  image: AssetsManager.visa,
                  subTitle: BlocProvider.of<PaymentCubit>(context).cardNumber ??
                      AppStrings.addPaymentMethod,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
