import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanshop/core/resources/app_size.dart';
import 'package:yallanshop/core/resources/assets_manager.dart';
import 'package:yallanshop/core/resources/colors_manager.dart';
import 'package:yallanshop/features/register/presentation/cubits/google_sign_in_cubit/google_sign_in_cubit.dart';
import 'package:yallanshop/features/register/presentation/view/widget/custom_button.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomSocialButton(
          onTap: () {},
          color: ColorsManager.facebookColor,
          image: AssetsManager.facebookImage,
        ),
        const SizedBox(height: AppSize.s10),
        CustomSocialButton(
          onTap: () {},
          color: ColorsManager.twitterColor,
          image: AssetsManager.twitterImage,
        ),
        const SizedBox(height: AppSize.s10),
        CustomSocialButton(
          onTap: () {
            BlocProvider.of<GoogleSignInCubit>(context).signInWithGoogle();
          },
          color: ColorsManager.googleColor,
          image: AssetsManager.googleImage,
        ),
        const SizedBox(height: AppSize.s10),
      ],
    );
  }
}
