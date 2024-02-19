import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yallanshop/core/resources/app_size.dart';
import 'package:yallanshop/core/resources/app_strings.dart';
import 'package:yallanshop/core/resources/colors_manager.dart';
import 'package:yallanshop/core/resources/style.dart';
import 'package:yallanshop/core/utils/app_router.dart';
import 'package:yallanshop/core/widgets/custom_progress_indicator.dart';
import 'package:yallanshop/core/widgets/toast.dart';
import 'package:yallanshop/features/register/presentation/cubits/sign_in_cubit/sign_in_cubit.dart';
import 'package:yallanshop/features/register/presentation/cubits/sign_in_cubit/sign_in_state.dart';
import 'package:yallanshop/features/register/presentation/view/widget/custom_app_bar.dart';
import 'package:yallanshop/features/register/presentation/view/widget/custom_bottom_button.dart';
import 'package:yallanshop/features/register/presentation/view/widget/custom_text_form_field.dart';

class SignInViewBody extends StatefulWidget {
  const SignInViewBody({super.key});

  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
}

class _SignInViewBodyState extends State<SignInViewBody> {
  final formKy = GlobalKey<FormState>();
  String? email;
  bool switchValue = true;
  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is SignInErrorState) {
          showToast(msg: state.errorMessage, color: ColorsManager.redColor);
        } else if (state is SignInSuccessState) {
          if (state.loginModel.status == true) {
            saveLoginToken(switchValue, state.loginModel.data!.token!);
            showToast(msg: state.loginModel.message!, color: Colors.green);
            GoRouter.of(context).push(RouterPath.selectView);
          } else {
            showToast(
                msg: state.loginModel.message!, color: ColorsManager.redColor);
          }
        } else {
          const CustomProgressIndicator();
        }
      },
      child: SafeArea(
          child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const CustomAppBar(),
                    Text(
                      AppStrings.welcome,
                      style: StyleManager.headLine1,
                    ),
                    Text(
                      AppStrings.requestData,
                      style: StyleManager.subtitle,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(PaddingSize.s20),
                  child: Form(
                    key: formKy,
                    child: Column(
                      children: [
                        CustomTextFormField(
                          label: AppStrings.emailAddressLabel,
                          keyboardType: TextInputType.emailAddress,
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return AppStrings.fieldRequired;
                            } else {
                              BlocProvider.of<SignInCubit>(context).email = val;
                              email = val;
                              return null;
                            }
                          },
                        ),
                        CustomPasswordTextFormField(
                          label: AppStrings.password,
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return AppStrings.fieldRequired;
                            } else {
                              BlocProvider.of<SignInCubit>(context).password =
                                  val;
                              return null;
                            }
                          },
                        ),
                        const SizedBox(height: AppSize.s20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () => GoRouter.of(context).push(
                                RouterPath.forgotPasswordView,
                              ),
                              child: Text(
                                AppStrings.forgotPassword,
                                style: StyleManager.title1.copyWith(
                                  color: ColorsManager.redColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              AppStrings.rememberMe,
                              style: StyleManager.title1,
                            ),
                            Switch.adaptive(
                              value: switchValue,
                              onChanged: (val) {
                                setState(() {
                                  switchValue = val;
                                });
                              },
                              activeColor: Colors.white,
                              activeTrackColor: Colors.green,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                CustomBottomButton(
                  text: AppStrings.signIn,
                  onPressed: () {
                    if (formKy.currentState!.validate()) {
                      BlocProvider.of<SignInCubit>(context).signIn();
                    }
                  },
                ),
              ],
            ),
          )
        ],
      )),
    );
  }

  saveLoginToken(bool switchValue, String token) async {
    if (switchValue) {
      final SharedPreferences shrdPrfs = await SharedPreferences.getInstance();
      await shrdPrfs.setString('token', token);
    }
  }
}
