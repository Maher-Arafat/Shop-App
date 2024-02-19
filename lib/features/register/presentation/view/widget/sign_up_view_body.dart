import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:yallanshop/core/resources/app_size.dart';
import 'package:yallanshop/core/resources/app_strings.dart';
import 'package:yallanshop/core/resources/style.dart';
import 'package:yallanshop/core/utils/app_router.dart';
import 'package:yallanshop/core/widgets/snack_bar.dart';
import 'package:yallanshop/features/register/presentation/cubits/sign_up_cubit/sign_up_cubit.dart';
import 'package:yallanshop/features/register/presentation/cubits/sign_up_cubit/sign_up_state.dart';
import 'package:yallanshop/features/register/presentation/view/widget/custom_app_bar.dart';
import 'package:yallanshop/features/register/presentation/view/widget/custom_bottom_button.dart';
import 'package:yallanshop/features/register/presentation/view/widget/custom_text_form_field.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  final formKy = GlobalKey<FormState>();
  bool switchValue = true;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit,SignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccessState) {
          if (state.registerModel.status == true) {
            GoRouter.of(context).push(RouterPath.signUpView);
          } else {
            showSnackBar(context: context, text: state.registerModel.message!);
          }
        } else if (state is SignUpErrorState) {
          showSnackBar(context: context, text: state.errorMessage);
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        const CustomAppBar(),
                        Text(AppStrings.signUp, style: StyleManager.headLine1),
                      ],
                    ),
                    Form(
                      key: formKy,
                      child: Padding(
                        padding: const EdgeInsets.all(PaddingSize.s20),
                        child: Column(
                          children: [
                            CustomTextFormField(
                              label: AppStrings.userName,
                              validator: (val) {
                                BlocProvider.of<SignUpCubit>(context).name =
                                    val;
                                return null;
                              },
                            ),
                            CustomTextFormField(
                              keyboardType: TextInputType.emailAddress,
                              label: AppStrings.emailAddressLabel,
                              validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return AppStrings.fieldRequired;
                                } else {
                                  BlocProvider.of<SignUpCubit>(context).email =
                                      val;
                                  return null;
                                }
                              },
                            ),
                            CustomTextFormField(
                              label: AppStrings.password,
                              validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return AppStrings.fieldRequired;
                                } else {
                                  BlocProvider.of<SignUpCubit>(context)
                                      .password = val;
                                  return null;
                                }
                              },
                            ),
                            CustomTextFormField(
                              label: AppStrings.phone,
                              validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return AppStrings.fieldRequired;
                                } else {
                                  BlocProvider.of<SignUpCubit>(context).phone =
                                      val;
                                  return null;
                                }
                              },
                            ),
                            const SizedBox(height: AppSize.s20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(AppStrings.rememberMe,
                                    style: StyleManager.title1),
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
                      text: AppStrings.signUp,
                      onPressed: () {
                        if (formKy.currentState!.validate()) {
                          BlocProvider.of<SignUpCubit>(context).signUp();
                        }
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
