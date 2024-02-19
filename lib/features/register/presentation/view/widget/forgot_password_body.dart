import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yallanshop/core/resources/app_strings.dart';
import 'package:yallanshop/core/resources/assets_manager.dart';
import 'package:yallanshop/core/resources/style.dart';
import 'package:yallanshop/core/utils/app_router.dart';
import 'package:yallanshop/features/register/presentation/view/widget/custom_bottom_button.dart';
import 'package:yallanshop/features/register/presentation/view/widget/custom_text_form_field.dart';

class ForgotPasswordViewBody extends StatelessWidget {
  const ForgotPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(height: 20),
                Text(
                  AppStrings.forgotPassword,
                  style: StyleManager.headLine1,
                ),
                const SizedBox(height: 70),
                Image.asset(AssetsManager.forgotPasswordImage),
                const SizedBox(height: 80),
                CustomTextFormField(
                    label: AppStrings.emailAddressLabel,
                    keyboardType: TextInputType.emailAddress,
                    validator: (val) {
                      return null;
                    })
              ],
            ),
          ),
        ),
        Column(
          children: [
            Text(
              AppStrings.requestEmailAndPassword,
              style: StyleManager.subtitle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 50),
            CustomBottomButton(
                text: AppStrings.confirm,
                onPressed: () {
                  GoRouter.of(context).push(
                    RouterPath.verificationCodeView,
                  );
                })
          ],
        )
      ],
    );
  }
}
