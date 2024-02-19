import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yallanshop/core/resources/app_strings.dart';
import 'package:yallanshop/core/resources/assets_manager.dart';
import 'package:yallanshop/core/resources/style.dart';
import 'package:yallanshop/core/utils/app_router.dart';
import 'package:yallanshop/features/register/presentation/view/widget/custom_bottom_button.dart';

class OrderConfirmedViewBody extends StatelessWidget {
  const OrderConfirmedViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width / 5,
                height: MediaQuery.sizeOf(context).height / 5,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(AssetsManager.orderConfirmedImage),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              Text(AppStrings.orderConfirmed, style: StyleManager.headLine1),
              const SizedBox(height: 10),
              Text(
                AppStrings.ansConfirmation,
                style: StyleManager.subtitle,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        CustomBottomButton(
          text: AppStrings.continueShopping,
          onPressed: () =>
              GoRouter.of(context).pushReplacement(RouterPath.selectView),
        ),
      ],
    );
  }
}
