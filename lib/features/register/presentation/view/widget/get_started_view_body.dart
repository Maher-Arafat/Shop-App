import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yallanshop/core/resources/app_size.dart';
import 'package:yallanshop/core/resources/app_strings.dart';
import 'package:yallanshop/core/resources/style.dart';
import 'package:yallanshop/core/utils/app_router.dart';
import 'package:yallanshop/features/register/presentation/view/widget/custom_app_bar.dart';
import 'package:yallanshop/features/register/presentation/view/widget/custom_bottom_button.dart';
import 'package:yallanshop/features/register/presentation/view/widget/social_button.dart';

class GetStartedViewBody extends StatelessWidget {
  const GetStartedViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              const CustomAppBar(),
              Text(
                AppStrings.letsStart,
                style: StyleManager.headLine1,
              ),
            ],
          ),
          const SocialButtons(),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppStrings.alreadyAccount,
                    style: StyleManager.subtitle,
                  ),
                  TextButton(
                    onPressed: () =>
                        GoRouter.of(context).push(RouterPath.signInView),
                    style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(0),
                        splashFactory: NoSplash.splashFactory),
                    child: Text(
                      AppStrings.signIn,
                      style: StyleManager.title2,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSize.s20),
              CustomBottomButton(
                text: AppStrings.newAccount,
                onPressed: () =>
                    GoRouter.of(context).push(RouterPath.signUpView),
              ),
            ],
          )
        ],
      ),
    );
  }
}
