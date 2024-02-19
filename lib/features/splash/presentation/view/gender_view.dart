import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yallanshop/core/resources/app_size.dart';
import 'package:yallanshop/core/resources/app_strings.dart';
import 'package:yallanshop/core/resources/assets_manager.dart';
import 'package:yallanshop/core/resources/colors_manager.dart';
import 'package:yallanshop/core/resources/style.dart';
import 'package:yallanshop/core/utils/app_router.dart';
import 'package:yallanshop/features/splash/presentation/view/widgets/custom_button.dart';

class GenderView extends StatelessWidget {
  const GenderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.primary,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(
            PaddingSize.s10,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 100),
                      child: SizedBox(
                        width: MediaQuery.sizeOf(context).width / 2,
                        child: Image.asset(AssetsManager.checkOut),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.sizeOf(context).width,
                height: 260,
                decoration: BoxDecoration(
                  color: ColorsManager.white,
                  borderRadius: BorderRadius.circular(AppSize.s20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(PaddingSize.s15),
                  child: Column(
                    children: [
                      const SizedBox(height: AppSize.s10),
                      Text(AppStrings.feilingGood,
                          style: StyleManager.headLine2),
                      const SizedBox(height: AppSize.s14),
                      Text(
                        AppStrings.welcomeSentnce,
                        style: StyleManager.subtitle,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: AppSize.s14),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomButton(
                            color: ColorsManager.primary,
                            textStyle: StyleManager.purpleButtonText,
                            text: 'Men',
                            onPressed: () {
                              setGender('men');
                              GoRouter.of(context)
                                  .push(RouterPath.getStartedView);
                            },
                          ),
                          const SizedBox(width: AppSize.s5),
                          CustomButton(
                            color: ColorsManager.darkWhite,
                            textStyle: StyleManager.whiteButtonText,
                            text: 'Women',
                            onPressed: () {
                              setGender('women');
                              GoRouter.of(context)
                                  .push(RouterPath.getStartedView);
                            },
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: () {
                          GoRouter.of(context).push(RouterPath.getStartedView);
                        },
                        style: TextButton.styleFrom(
                          splashFactory: NoSplash.splashFactory,
                        ),
                        child: Text(
                          AppStrings.skip,
                          style: StyleManager.subtitle,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

setGender(String gender) async {
  final SharedPreferences prfs = await SharedPreferences.getInstance();
  await prfs.setString('gender', gender);
}
